import pandas as pd

import Codes.sensor_data as sensor_data

import math

class Shot:
    def __init__(self, sensor_data_list):
        self.interval = 0.2
        self.sensor_data_list = sensor_data_list  # List of SensorData objects
        self.bat_speed = self.calculate_bat_speed()
        self.impact_value = self.calculate_impact_value()
        self.bat_lift_angle = self.calculate_bat_lift_angle()
        self.bat_face_angle = self.calculate_bat_face_angle()

    def calculate_bat_speed(self):
        speed = 0.0
        for data in self.sensor_data_list:
            acceleration_value = math.sqrt(data.ax**2 + data.ay**2 + data.az**2)
            speed = speed + acceleration_value * self.interval
        
        return speed

    def calculate_impact_value(self):
        threshold = 0.5

    def calculate_bat_lift_angle(self):
        # Calculate the bat lift angle using the gyroscope data
        angles = []
        for data in self.sensor_data_list:
            angle = math.atan2(data.gy, data.gz) * (180 / math.pi)
            angles.append(angle)
        
        return max(angles) - min(angles)  # Difference between maximum and minimum angles

    def calculate_bat_face_angle(self):
        # Calculate the bat face angle using the gyroscope data
        angles = []
        for data in self.sensor_data_list:
            angle = math.atan2(data.gx, data.gz) * (180 / math.pi)
            angles.append(angle)
        return max(angles) - min(angles)  # Difference between maximum and minimum angles
    