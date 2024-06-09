import serial

class SensorData:
    def __init__(self, timestamp, ax, ay, az, gx, gy, gz):
        self.timestamp = timestamp  # Timestamp of the data point
        self.ax = ax  # Acceleration in X-axis
        self.ay = ay  # Acceleration in Y-axis
        self.az = az  # Acceleration in Z-axis
        self.gx = gx  # Gyroscope data around X-axis
        self.gy = gy  # Gyroscope data around Y-axis
        self.gz = gz  # Gyroscope data around Z-axis