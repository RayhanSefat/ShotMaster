from flask import Flask, request
from flask_socketio import SocketIO, emit
from datetime import datetime, timedelta
import json
import atexit
import threading
import time
from pymongo import MongoClient

app = Flask(__name__)
socketio = SocketIO(app)

data_list = []
last_data_time = datetime.now()

# Connect to MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client["shot_data"]
collection = db["raw_data2"]

def generate_default_data():
    return {    
        "accelX": -2.695871115,
        "accelY": -0.708683729,
        "accelZ": 11.08754826,
        "gyroX": 0.009192956,
        "gyroY": 0.003464012,
        "gyroZ": 0.028245023,
        "piezoVolt1": 0.386813194,
        "piezoVolt2": 0.153919414,
        "piezoVolt3": 0.056856595,
        "piezoVolt4": 0.065456554,
        "time": datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    }

def check_data_interval():
    global last_data_time
    while True:
        time.sleep(5)
        current_time = datetime.now()
        if (current_time - last_data_time).total_seconds() > 5:
            default_data = generate_default_data()
            data_list.append(default_data)
            collection.insert_one(default_data)
            socketio.emit('sensor_data', default_data)
            last_data_time = current_time
            print(f"Default data inserted due to timeout: {default_data}")

@app.route('/update', methods=['POST'])
def update_data():
    global last_data_time
    data = request.json
    last_data_time = datetime.now()
    data['time'] = last_data_time.strftime('%Y-%m-%d %H:%M:%S')
    data_list.append(data)
    socketio.emit('sensor_data', data)
    print(f"Data received and appended: {data}")
    
    # Save data to MongoDB
    collection.insert_one(data)
    
    return 'OK'

def save_data():
    if data_list:
        with open('data1.json', 'w') as f:
            json.dump(data_list, f, indent=4)
        print("Data saved to data1.json")
    else:
        print("No data to save")

# Register save_data to be called on exit
atexit.register(save_data)

if __name__ == '__main__':
    # Start the background thread to check data interval
    # threading.Thread(target=check_data_interval, daemon=True).start()
    socketio.run(app, host='0.0.0.0', port=8000, debug=True)
