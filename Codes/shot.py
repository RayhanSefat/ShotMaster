import pandas as pd

import Codes.sensor_data as sensor_data

import math

class Shot:
    def __init__(self, sensor_data_list):
        self.sensor_data_list = sensor_data_list  # List of SensorData objects
        self.bat_speed = self.calculate_bat_speed()
        self.impact_speed = self.calculate_impact_speed()
        self.bat_lift_angle = self.calculate_bat_lift_angle()
        self.bat_face_angle = self.calculate_bat_face_angle()

    def calculate_bat_speed(self):
        # Calculate the bat speed using the acceleration data
        speeds = []
        for data in self.sensor_data_list:
            speed = math.sqrt(data.ax**2 + data.ay**2 + data.az**2)
            speeds.append(speed)

        # Calculate the average of every three consecutive speeds
        average_speeds = []
        for i in range(len(speeds) - 2):
            avg_speed = (speeds[i] + speeds[i + 1] + speeds[i + 2]) / 3
            average_speeds.append(avg_speed)

        return max(average_speeds)  # Maximum average speed of three consecutive speeds

    def calculate_impact_speed(self):
        # Calculate the impact speed using the maximum acceleration value
        impact_speeds = []
        for data in self.sensor_data_list:
            impact_speed = math.sqrt(data.ax**2 + data.ay**2 + data.az**2)
            impact_speeds.append(impact_speed)
        return max(impact_speeds)  # Maximum speed during the shot

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
    