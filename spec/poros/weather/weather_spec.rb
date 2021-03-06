require 'rails_helper'

describe Weather do
    it "Exists" do
        data = {
        "lat": 39.74,
        "lon": -104.98,
        "timezone": "America/Denver",
        "timezone_offset": -25200,
        "current": {
            "dt": 1604356053,
            "sunrise": 1604323817,
            "sunset": 1604361396,
            "temp": 75.31,
            "feels_like": 66.88,
            "pressure": 1026,
            "humidity": 8,
            "dew_point": 12.36,
            "uvi": 3.43,
            "clouds": 20,
            "visibility": 10000,
            "wind_speed": 4.7,
            "wind_deg": 110,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ]
        },
        "daily": [
            {
                "dt": 1604340000,
                "sunrise": 1604323817,
                "sunset": 1604361396,
                "temp": {
                    "day": 64.58,
                    "min": 49.3,
                    "max": 75.31,
                    "night": 56.82,
                    "eve": 69.53,
                    "morn": 49.3
                },
                "feels_like": {
                    "day": 58.87,
                    "night": 50.76,
                    "eve": 63.18,
                    "morn": 42.85
                },
                "pressure": 1026,
                "humidity": 23,
                "dew_point": 10.81,
                "wind_speed": 2.37,
                "wind_deg": 159,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3.43
            },
            {
                "dt": 1604426400,
                "sunrise": 1604410285,
                "sunset": 1604447729,
                "temp": {
                    "day": 67.01,
                    "min": 52.32,
                    "max": 71.4,
                    "night": 58.14,
                    "eve": 65.05,
                    "morn": 52.32
                },
                "feels_like": {
                    "day": 62.53,
                    "night": 51.87,
                    "eve": 59.31,
                    "morn": 45.91
                },
                "pressure": 1018,
                "humidity": 23,
                "dew_point": 17.49,
                "wind_speed": 0.65,
                "wind_deg": 127,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 8,
                "pop": 0,
                "uvi": 3.22
            },
            {
                "dt": 1604512800,
                "sunrise": 1604496754,
                "sunset": 1604534064,
                "temp": {
                    "day": 68.77,
                    "min": 55.06,
                    "max": 73,
                    "night": 58.71,
                    "eve": 66.83,
                    "morn": 55.06
                },
                "feels_like": {
                    "day": 63.97,
                    "night": 51.35,
                    "eve": 56.66,
                    "morn": 48.45
                },
                "pressure": 1020,
                "humidity": 24,
                "dew_point": 29.21,
                "wind_speed": 1.81,
                "wind_deg": 209,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3.24
            },
            {
                "dt": 1604599200,
                "sunrise": 1604583223,
                "sunset": 1604620400,
                "temp": {
                    "day": 67.06,
                    "min": 54.12,
                    "max": 72.45,
                    "night": 57.97,
                    "eve": 66.85,
                    "morn": 54.12
                },
                "feels_like": {
                    "day": 61.11,
                    "night": 52,
                    "eve": 61.2,
                    "morn": 48.33
                },
                "pressure": 1022,
                "humidity": 25,
                "dew_point": 26.1,
                "wind_speed": 3.74,
                "wind_deg": 182,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0,
                "uvi": 3.33
            },
            {
                "dt": 1604685600,
                "sunrise": 1604669693,
                "sunset": 1604706738,
                "temp": {
                    "day": 68.77,
                    "min": 53.46,
                    "max": 73.15,
                    "night": 61.11,
                    "eve": 67.82,
                    "morn": 53.46
                },
                "feels_like": {
                    "day": 57.7,
                    "night": 47.73,
                    "eve": 58.05,
                    "morn": 47.26
                },
                "pressure": 1002,
                "humidity": 23,
                "dew_point": 22.89,
                "wind_speed": 12.68,
                "wind_deg": 182,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02d"
                    }
                ],
                "clouds": 14,
                "pop": 0,
                "uvi": 3.1
            },
            {
                "dt": 1604772000,
                "sunrise": 1604756162,
                "sunset": 1604793077,
                "temp": {
                    "day": 66.06,
                    "min": 40.91,
                    "max": 67.46,
                    "night": 40.91,
                    "eve": 59.05,
                    "morn": 55.96
                },
                "feels_like": {
                    "day": 48.11,
                    "night": 29.71,
                    "eve": 43.3,
                    "morn": 45.45
                },
                "pressure": 988,
                "humidity": 24,
                "dew_point": 20.23,
                "wind_speed": 24.58,
                "wind_deg": 193,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 0,
                "pop": 0.15,
                "uvi": 3.11
            },
            {
                "dt": 1604858400,
                "sunrise": 1604842631,
                "sunset": 1604879418,
                "temp": {
                    "day": 43.99,
                    "min": 22.98,
                    "max": 49.41,
                    "night": 22.98,
                    "eve": 46.67,
                    "morn": 37.44
                },
                "feels_like": {
                    "day": 36,
                    "night": 11.61,
                    "eve": 37,
                    "morn": 27.86
                },
                "pressure": 1012,
                "humidity": 36,
                "dew_point": -7.98,
                "wind_speed": 5.12,
                "wind_deg": 116,
                "weather": [
                    {
                        "id": 800,
                        "main": "Clear",
                        "description": "clear sky",
                        "icon": "01d"
                    }
                ],
                "clouds": 1,
                "pop": 0,
                "uvi": 3.01
            },
            {
                "dt": 1604944800,
                "sunrise": 1604929101,
                "sunset": 1604965761,
                "temp": {
                    "day": 20.62,
                    "min": 16.63,
                    "max": 22.68,
                    "night": 19.45,
                    "eve": 21.22,
                    "morn": 17.04
                },
                "feels_like": {
                    "day": 12.13,
                    "night": 11.16,
                    "eve": 12.88,
                    "morn": 7.18
                },
                "pressure": 1027,
                "humidity": 85,
                "dew_point": 8.8,
                "wind_speed": 5.7,
                "wind_deg": 70,
                "weather": [
                    {
                        "id": 601,
                        "main": "Snow",
                        "description": "snow",
                        "icon": "13d"
                    }
                ],
                "clouds": 100,
                "pop": 0.96,
                "snow": 3,
                "uvi": 2.34
            }
        ]
    }
        weather = Weather.new(data)

        expect(weather).to be_a(Weather)
        expect(weather.temperature).to be_a(Numeric)
        expect(weather.humidity).to be_a(Numeric)
        expect(weather.description).to be_a(String)
        expect(weather.daily).to be_an(Array)
        expect(weather.daily.first).to be_an(DailyForecast)
        expect(weather.daily.first.description).to be_a(String)
        expect(weather.daily.first.humidity).to be_a(Numeric)
        expect(weather.daily.first.temperature).to be_a(Numeric)
    end
end
