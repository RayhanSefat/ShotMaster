import pymongo
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import math

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

plt.figure(figsize=(10, 6))
plt.plot(df['time'], df['accelX'], label='accelX')
plt.plot(df['time'], df['accelY'], label='accelY')
plt.plot(df['time'], df['accelZ'], label='accelZ')
plt.xlabel('Time')
plt.ylabel('Raw data')
plt.title('Raw data over Time')
plt.legend()
plt.grid(True)
plt.show()

plt.figure(figsize=(10, 6))
plt.plot(df['time'], df['gyroX'], label='gyroX')
plt.plot(df['time'], df['gyroY'], label='gyroY')
plt.plot(df['time'], df['gyroZ'], label='gyroZ')
plt.xlabel('Time')
plt.ylabel('Raw data')
plt.title('Raw data over Time')
plt.legend()
plt.grid(True)
plt.show()

# Convert time column to datetime
df['time'] = pd.to_datetime(df['time'])

# Define the EMA function
def exponential_moving_average(data, alpha=0.1):
    ema_data = [data[0]]  # Initialize with the first data point
    for i in range(1, len(data)):
        ema_data.append(alpha * data[i] + (1 - alpha) * ema_data[-1])
    return ema_data

alpha = 0.1

# Apply EMA to each sensor axis
df['accelX_ema'] = exponential_moving_average(df['accelX'], alpha)
df['accelY_ema'] = exponential_moving_average(df['accelY'], alpha)
df['accelZ_ema'] = exponential_moving_average(df['accelZ'], alpha)
df['gyroX_ema'] = exponential_moving_average(df['gyroX'], alpha)
df['gyroY_ema'] = exponential_moving_average(df['gyroY'], alpha)
df['gyroZ_ema'] = exponential_moving_average(df['gyroZ'], alpha)

# Define thresholds for detecting shots (these need to be tuned based on your data)
ACC_THRESHOLD = 10.0
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

def hasImpacted(piezo1, piezo2, piezo3, piezo4):
    threshold = 0.5
    if piezo1 >= threshold or piezo2 >= threshold:
        return 1
    
    if piezo3 >= threshold or piezo4 >= threshold:
        return 0
    
    return -1

# Calculate bat speed for each detected shot
bat_speeds = df.loc[shot_indices].apply(lambda row: calculate_bat_speed(row['accelX_ema'], row['accelY_ema'], row['accelZ_ema']), axis=1)

# Get the timestamps and speeds of detected shots
shot_timestamps = df.loc[shot_indices, 'time']
shot_speeds = bat_speeds

# Combine timestamps and speeds into a DataFrame
shots_df = pd.DataFrame({'timestamp': shot_timestamps, 'bat_speed': shot_speeds})

print(f"Number of shots detected: {len(shots_df)}")
print("Timestamps and bat speeds of shots detected:")
print(shots_df)

# Optionally, close the MongoDB connection
client.close()
