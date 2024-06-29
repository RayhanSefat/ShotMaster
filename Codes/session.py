import Codes.shot as shot

from flask import Flask, jsonify
from datetime import datetime, timedelta

app = Flask(__name__)

class Session:
    def __init__(self):
        self.date_and_time = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
        self.shots = []  # List to store Shot objects
        self.total_bat_speed = 0
        self.total_impact_speed = 0
        self.total_bat_lift_angle = 0
        self.total_bat_face_angle = 0

        self.max_bat_speed = float('-inf')
        self.min_bat_speed = float('inf')
        self.max_impact_speed = float('-inf')
        self.min_impact_speed = float('inf')
        self.max_bat_lift_angle = float('-inf')
        self.min_bat_lift_angle = float('inf')
        self.max_bat_face_angle = float('-inf')
        self.min_bat_face_angle = float('inf')

    def add_shot(self, shot):
        self.shots.append(shot)
        self.total_bat_speed += shot.bat_speed
        self.total_impact_speed += shot.impact_speed
        self.total_bat_lift_angle += shot.bat_lift_angle
        self.total_bat_face_angle += shot.bat_face_angle

        self.max_bat_speed = max(self.max_bat_speed, shot.bat_speed)
        self.min_bat_speed = min(self.min_bat_speed, shot.bat_speed)
        self.max_impact_speed = max(self.max_impact_speed, shot.impact_speed)
        self.min_impact_speed = min(self.min_impact_speed, shot.impact_speed)
        self.max_bat_lift_angle = max(self.max_bat_lift_angle, shot.bat_lift_angle)
        self.min_bat_lift_angle = min(self.min_bat_lift_angle, shot.bat_lift_angle)
        self.max_bat_face_angle = max(self.max_bat_face_angle, shot.bat_face_angle)
        self.min_bat_face_angle = min(self.min_bat_face_angle, shot.bat_face_angle)

    def calculate_average_bat_speed(self):
        return self.total_bat_speed / len(self.shots) if self.shots else 0

    def calculate_average_impact_speed(self):
        return self.total_impact_speed / len(self.shots) if self.shots else 0

    def calculate_average_bat_lift_angle(self):
        return self.total_bat_lift_angle / len(self.shots) if self.shots else 0

    def calculate_average_bat_face_angle(self):
        return self.total_bat_face_angle / len(self.shots) if self.shots else 0

    @property
    def average_bat_speed(self):
        return self.calculate_average_bat_speed()

    @property
    def average_impact_speed(self):
        return self.calculate_average_impact_speed()

    @property
    def average_bat_lift_angle(self):
        return self.calculate_average_bat_lift_angle()

    @property
    def average_bat_face_angle(self):
        return self.calculate_average_bat_face_angle()
    
    def to_dict(self):
        return {
            'date_and_time': self.date_and_time,
            'shots': [vars(shot) for shot in self.shots],
            'average_bat_speed': self.average_bat_speed,
            'average_impact_speed': self.average_impact_speed,
            'average_bat_lift_angle': self.average_bat_lift_angle,
            'average_bat_face_angle': self.average_bat_face_angle,
            'max_bat_speed': self.max_bat_speed,
            'min_bat_speed': self.min_bat_speed,
            'max_impact_speed': self.max_impact_speed,
            'min_impact_speed': self.min_impact_speed,
            'max_bat_lift_angle': self.max_bat_lift_angle,
            'min_bat_lift_angle': self.min_bat_lift_angle,
            'max_bat_face_angle': self.max_bat_face_angle,
            'min_bat_face_angle': self.min_bat_face_angle,
        }