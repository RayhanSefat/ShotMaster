import Codes.session as session

import matplotlib.pyplot as plt

class PLot:
    def plot(sessions):
        # Collect average values for each session
        average_bat_speeds = []
        average_impact_speeds = []
        average_bat_lift_angles = []
        average_bat_face_angles = []
        session_dates = []

        for session in sessions:
            average_bat_speeds.append(session.average_bat_speed)
            average_impact_speeds.append(session.average_impact_speed)
            average_bat_lift_angles.append(session.average_bat_lift_angle)
            average_bat_face_angles.append(session.average_bat_face_angle)
            session_dates.append(session.date_and_time)

        # Plot the graphs
        plt.figure()
        plt.plot(session_dates, average_bat_speeds, marker='o', linestyle='-', color='b')
        plt.title('Average Bat Speed per Session')
        plt.xlabel('Session Date and Time')
        plt.ylabel('Bat Speed (m/s)')
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()

        plt.figure()
        plt.plot(session_dates, average_impact_speeds, marker='o', linestyle='-', color='g')
        plt.title('Average Impact Speed per Session')
        plt.xlabel('Session Date and Time')
        plt.ylabel('Impact Speed (m/s)')
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()

        plt.figure()
        plt.plot(session_dates, average_bat_lift_angles, marker='o', linestyle='-', color='r')
        plt.title('Average Bat Lift Angle per Session')
        plt.xlabel('Session Date and Time')
        plt.ylabel('Bat Lift Angle (degree)')
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()

        plt.figure()
        plt.plot(session_dates, average_bat_face_angles, marker='o', linestyle='-', color='c')
        plt.title('Average Bat Face Angle per Session')
        plt.xlabel('Session Date and Time')
        plt.ylabel('Bat Face Angle (degree)')
        plt.xticks(rotation=45)
        plt.grid(True)
        plt.tight_layout()
        plt.show()