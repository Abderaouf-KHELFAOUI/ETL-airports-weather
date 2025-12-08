
CREATE TABLE AIRLINES (
    airline_code CHAR(2) PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL
);

CREATE TABLE AIRPORTS (
    iata_code CHAR(3) PRIMARY KEY,
    airport_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) NOT NULL,
    latitude FLOAT ,
    longitude FLOAT ,
    
    CHECK(latitude BETWEEN -90 AND 90 AND longitude BETWEEN -180 AND 180)
);

CREATE TABLE FLIGHTS (
    flight_id INTEGER PRIMARY KEY,
    flight_date DATE NOT NULL,
    flight_number VARCHAR(10) NOT NULL,
    dep_time TEXT ,
    dep_delay INTEGER NOT NULL,
    cancelled BOOLEAN NOT NULL,
    airline_code CHAR(2) NOT NULL,
    origin_airport CHAR(3) NOT NULL,
    dest_airport CHAR(3) NOT NULL,
    CHECK(dep_time GLOB '[0-2][0-9]:[0-5][0-9]:[0-5][0-9]')
    FOREIGN KEY (airline_code) 
        REFERENCES AIRLINES(airline_code),
    FOREIGN KEY (origin_airport) 
        REFERENCES AIRPORTS(iata_code),
    FOREIGN KEY (dest_airport) 
        REFERENCES AIRPORTS(iata_code)
);

CREATE TABLE WEATHER (
    weather_id INTEGER PRIMARY KEY,
    reading_time TIMESTAMP NOT NULL,
    wind_speed FLOAT,
    temperature FLOAT,
    airport_code CHAR(3) NOT NULL,
    FOREIGN KEY (airport_code) REFERENCES AIRPORTS(iata_code)
);