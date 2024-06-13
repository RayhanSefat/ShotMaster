#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_MPU6050.h>

const char* ssid = "IIT-WIFI";
const char* password = "IIT786445";  
const char* serverAddress = "10.100.201.107";
const int serverPort = 8000;

// Initialize MPU6050
Adafruit_MPU6050 mpu;

const int piezoPin1 = 32;
const int piezoPin2 = 33;
const int piezoPin3 = 34;
const int piezoPin4 = 35;

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());

  // Initialize MPU6050
  if (!mpu.begin()) {
    Serial.println("Failed to find MPU6050 chip");
    while (1) {
      delay(10);
    }
  }

  // Initialize piezo pins as input
  pinMode(piezoPin1, INPUT);
  pinMode(piezoPin2, INPUT);
  pinMode(piezoPin3, INPUT);
  pinMode(piezoPin4, INPUT);
}

void loop() {
  // Read MPU6050 data
  sensors_event_t accel, gyro, temp;
  mpu.getEvent(&accel, &gyro, &temp);

  // Read piezoelectric sensor data
  int piezoValue1 = analogRead(piezoPin1);
  int piezoValue2 = analogRead(piezoPin2);
  int piezoValue3 = analogRead(piezoPin3);
  int piezoValue4 = analogRead(piezoPin4);

  // Convert piezo values to voltage
  float piezoVolt1 = piezoValue1 * (3.3 / 4095.0);
  float piezoVolt2 = piezoValue2 * (3.3 / 4095.0);
  float piezoVolt3 = piezoValue3 * (3.3 / 4095.0);
  float piezoVolt4 = piezoValue4 * (3.3 / 4095.0);

  // Send sensor data to Flask backend
  sendSensorData(accel.acceleration.x, accel.acceleration.y, accel.acceleration.z,
                 gyro.gyro.x, gyro.gyro.y, gyro.gyro.z, 
                 piezoVolt1, piezoVolt2, piezoVolt3, piezoVolt4);

  delay(200); // Adjust delay as needed
}

void sendSensorData(float accelX, float accelY, float accelZ,
                    float gyroX, float gyroY, float gyroZ, 
                    float piezoVolt1, float piezoVolt2, float piezoVolt3, float piezoVolt4) {
  HTTPClient http;

  // Create a JSON object
  StaticJsonDocument<600> jsonDocument;
  jsonDocument["accelX"] = accelX;
  jsonDocument["accelY"] = accelY;
  jsonDocument["accelZ"] = accelZ;
  jsonDocument["gyroX"] = gyroX;
  jsonDocument["gyroY"] = gyroY;
  jsonDocument["gyroZ"] = gyroZ;
  jsonDocument["piezoVolt1"] = piezoVolt1;
  jsonDocument["piezoVolt2"] = piezoVolt2;
  jsonDocument["piezoVolt3"] = piezoVolt3;
  jsonDocument["piezoVolt4"] = piezoVolt4;

  // Serialize JSON to a string
  String jsonString;
  serializeJson(jsonDocument, jsonString);

  http.begin("http://" + String(serverAddress) + ":" + String(serverPort) + "/update");
  http.addHeader("Content-Type", "application/json");

  int httpResponseCode = http.POST(jsonString);
  if (httpResponseCode > 0) {
    Serial.print("HTTP POST request sent to ");
    Serial.println(serverAddress);
  } else {
    Serial.print("Error sending HTTP POST request: ");
    Serial.println(httpResponseCode);
  }
  http.end();
}
