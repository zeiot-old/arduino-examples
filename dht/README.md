This is a module to use temperature/humidity sensors (DHT22).

* Build:

        $ make build project=dht

* Upload:

        $ make upload project=dht

* Check output:

        $ make monitor
        platformio serialports monitor
        --- Miniterm on /dev/ttyACM0  9600,8,N,1 ---
        --- Quit: Ctrl+] | Menu: Ctrl+T | Help: Ctrl+T followed by Ctrl+H ---
        Humidity: 33.40 %       Temperature: 31°
        Humidity: 33.40 %       Temperature: 31°
        Humidity: 33.40 %       Temperature: 31°


See: https://github.com/adafruit/DHT-sensor-library
