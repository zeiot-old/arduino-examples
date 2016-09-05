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

int photocellPin = 0; // the cell and 10K pulldown are connected to a0
int photocellReading; // the analog reading from the analog resistor divider

void setup(void) {
  Serial.begin(9600);
}

void loop(void) {
  photocellReading = analogRead(photocellPin);
  Serial.print("\nAnalog reading = ");
  Serial.print(photocellReading);
  if (photocellReading < 10) {
    Serial.print(" - Night");
  } else if (photocellReading < 200) {
    Serial.print(" - Dark");
  } else if (photocellReading < 500) {
    Serial.print(" - Light");
  } else if (photocellReading < 800) {
    Serial.print(" - Bright");
  } else {
    Serial.print(" - Very bright");
  }
  delay(5000);
}