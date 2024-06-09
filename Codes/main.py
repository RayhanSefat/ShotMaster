import Codes.sensor_data as sensor_data

from fastapi import FastAPI, Request

if __name__ == '__main__':
    sensor_data = sensor_data.Sensor()
    app = FastAPI()

    @app.get("/receive-data")
    async def receive_data(request: Request):
        accelX = request.query_params.get('AccelX')
        accelY = request.query_params.get('AccelY')
        accelZ = request.query_params.get('AccelZ')
        
        # Process or store the received data as needed
        print("Received Acceleration Data:")
        print("AccelX:", accelX)
        print("AccelY:", accelY)
        print("AccelZ:", accelZ)
        
        return {"AccelX": accelX, "AccelY": accelY, "AccelZ": accelZ}