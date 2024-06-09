import Codes.shot as shot

from datetime import datetime, timedelta

class Session:
    def __init__(self):
        self.date_and_time = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
        self.shots = []  # List to store Shot objects
        self.total_bat_speed = 0
        self.total_impact_speed = 0
        self.total_bat_lift_angle = 0
        self.total_bat_face_angle = 0
        self.total_downswing_angle = 0

        self.max_bat_speed = float('-inf')
        self.min_bat_speed = float('inf')
        self.max_impact_speed = float('-inf')
        self.min_impact_speed = float('inf')
        self.max_bat_lift_angle = float('-inf')
        self.min_bat_lift_angle = float('inf')
        self.max_bat_face_angle = float('-inf')
        self.min_bat_face_angle = float('inf')
        self.max_downswing_angle = float('-inf')
        self.min_downswing_angle = float('inf')

    def add_shot(self, shot):
        self.shots.append(shot)
        self.total_bat_speed += shot.bat_speed
        self.total_impact_speed += shot.impact_speed
        self.total_bat_lift_angle += shot.bat_lift_angle
        self.total_bat_face_angle += shot.bat_face_angle
        self.total_downswing_angle += shot.downswing_angle

        self.max_bat_speed = max(self.max_bat_speed, shot.bat_speed)
        self.min_bat_speed = min(self.min_bat_speed, shot.bat_speed)
        self.max_impact_speed = max(self.max_impact_speed, shot.impact_speed)
        self.min_impact_speed = min(self.min_impact_speed, shot.impact_speed)
        self.max_bat_lift_angle = max(self.max_bat_lift_angle, shot.bat_lift_angle)
        self.min_bat_lift_angle = min(self.min_bat_lift_angle, shot.bat_lift_angle)
        self.max_bat_face_angle = max(self.max_bat_face_angle, shot.bat_face_angle)
        self.min_bat_face_angle = min(self.min_bat_face_angle, shot.bat_face_angle)
        self.max_downswing_angle = max(self.max_downswing_angle, shot.downswing_angle)
        self.min_downswing_angle = min(self.min_downswing_angle, shot.downswing_angle)

    def calculate_average_bat_speed(self):
        return self.total_bat_speed / len(self.shots) if self.shots else 0

    def calculate_average_impact_speed(self):
        return self.total_impact_speed / len(self.shots) if self.shots else 0

    def calculate_average_bat_lift_angle(self):
        return self.total_bat_lift_angle / len(self.shots) if self.shots else 0

    def calculate_average_bat_face_angle(self):
        return self.total_bat_face_angle / len(self.shots) if self.shots else 0

    def calculate_average_downswing_angle(self):
        return self.total_downswing_angle / len(self.shots) if self.shots else 0

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

    @property
    def average_downswing_angle(self):
        return self.calculate_average_downswing_angle()