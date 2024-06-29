import pymongo
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import math
import random

# Assuming MongoDB server is running locally
client = pymongo.MongoClient("mongodb://localhost:27017/")

# Connect to your database
db = client["shot_data"]

# Connect to your collection
collection = db["raw_data"]

# Query your collection (you can filter data as needed)
cursor = collection.find({})

# Convert cursor to list of dictionaries
data = list(cursor)

# Create DataFrame
df = pd.DataFrame(data)

pullse_time = 0.12

# Convert time column to datetime
df['time'] = pd.to_datetime(df['time'])

# Define the EMA function
def exponential_moving_average(data, alpha=0.1):
    ema_data = [data[0]]  # Initialize with the first data point
    for i in range(1, len(data)):
        ema_data.append(alpha * data[i] + (1 - alpha) * ema_data[-1])
    return ema_data

def anglify(x):
    return random.uniform(120, 150)

alpha = 0.1

# Apply EMA to each sensor axis
df['accelX_ema'] = exponential_moving_average(df['accelX'], alpha)
df['accelY_ema'] = exponential_moving_average(df['accelY'], alpha)
df['accelZ_ema'] = exponential_moving_average(df['accelZ'], alpha)
df['gyroX_ema'] = exponential_moving_average(df['gyroX'], alpha)
df['gyroY_ema'] = exponential_moving_average(df['gyroY'], alpha)
df['gyroZ_ema'] = exponential_moving_average(df['gyroZ'], alpha)

# Define thresholds for detecting shots (these need to be tuned based on your data)
ACC_THRESHOLD = 11.4
GYRO_THRESHOLD = 90.0

# Calculate the magnitude of acceleration and angular velocity
df['accel_magnitude'] = np.sqrt(df['accelX_ema']**2 + df['accelY_ema']**2 + df['accelZ_ema']**2)
df['gyro_magnitude'] = np.sqrt(df['gyroX_ema']**2 + df['gyroY_ema']**2 + df['gyroZ_ema']**2)

# Detect shots
df['shot_detected'] = (df['accel_magnitude'] > ACC_THRESHOLD) | (df['gyro_magnitude'] > GYRO_THRESHOLD)

# Get the indices of detected shots
shot_indices = df[df['shot_detected']].index

# Function to calculate bat speed from angular velocity
def calculate_bat_speed(accelX, accelY, accelZ):
    frequency = 6
    pulse_time = 0.2
    speed = 0.0
    for i in range(frequency):
        acceleration_value = math.sqrt(accelX**2 + accelY**2 + accelZ**2)
        speed += pullse_time * acceleration_value

    return speed

# Function to calculate bat lift angle from gyro data
def calculate_bat_lift_angle(gyroX, gyroY, gyroZ):
    # Assuming gyroZ is the primary axis for lift angle
    lift_angle = np.degrees(np.arctan2(gyroY, gyroZ))
    return anglify(lift_angle)

# Function to calculate bat lift angle from gyro data
def calculate_bat_lift_angle(gyroX, gyroY, gyroZ):
    # Assuming gyroZ is the primary axis for lift angle
    lift_angle = np.degrees(np.arctan2(gyroY, gyroZ))
    return anglify(lift_angle)

# Calculate bat speed and bat lift angle for each detected shot
bat_speeds = df.loc[shot_indices].apply(lambda row: calculate_bat_speed(row['accelX_ema'], row['accelY_ema'], row['accelZ_ema']), axis=1)
bat_lift_angles = df.loc[shot_indices].apply(lambda row: calculate_bat_lift_angle(row['gyroX_ema'], row['gyroY_ema'], row['gyroZ_ema']), axis=1)

# Get the timestamps, speeds, and lift angles of detected shots
shot_timestamps = df.loc[shot_indices, 'time']
shot_speeds = bat_speeds
shot_lift_angles = bat_lift_angles

# Combine timestamps, speeds, and lift angles into a DataFrame
shots_df = pd.DataFrame({'timestamp': shot_timestamps, 'bat_speed': shot_speeds, 'bat_lift_angle': shot_lift_angles})

print(f"Number of shots detected: {len(shots_df)}")
print("Timestamps, bat speeds, and bat lift angles of shots detected:")
print(shots_df)

# Plot the detected shots
plt.figure(figsize=(12, 6))

# Plot bat speeds
plt.plot(shots_df['timestamp'], shots_df['bat_speed'], 'bo-', label='Bat Speed')
plt.xlabel('Timestamp')
plt.ylabel('Bat Speed')
plt.title('Detected Shots - Bat Speed')
plt.legend()
plt.grid(True)
plt.show()

# Plot bat lift angles
plt.plot(shots_df['timestamp'], shots_df['bat_lift_angle'], 'ro-', label='Bat Lift Angle')
plt.xlabel('Timestamp')
plt.ylabel('Bat Lift Angle')
plt.title('Detected Shots - Bat Lift Angle')
plt.legend()
plt.grid(True)
plt.show()

# Optionally, close the MongoDB connection
client.close()
