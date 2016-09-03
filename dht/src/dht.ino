/*
 * Copyright (C) 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <DHT.h>

#define DHTPIN 2

#define DHTTYPE DHT22

// Initialization of the DHT Sensor
DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  Serial.println("DHT");
  dht.begin();
}

void loop() {
  // Measure from DHT
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();
  // Read in Celsius but Fahrenheit is possible : (isFahrenheit = true)
  // float temperature = dht.readTemperature(true);

  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("[Jarvis] Error reading data from DHT sensor");
    return;
  }

  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print((int)temperature);
  Serial.print(" *C ");
  Serial.print(temperature);

  // Wait 500 ms
  delay(500);
}
