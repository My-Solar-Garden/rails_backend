# [My Solar Garden](https://solar-garden-fe.herokuapp.com/) - Backend API
![](https://img.shields.io/badge/version-1.0-orange)
![](https://img.shields.io/badge/Rails-5.2.4.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
[![Build Status](https://travis-ci.com/My-Solar-Garden/rails_backend.svg?branch=main)](https://travis-ci.com/My-Solar-Garden/rails_backend)

Welcome to the backend API for [[My Solar Garden](https://solar-garden-fe.herokuapp.com/) web application. If you need help or have a problem, please submit an issue and one of our team members will get to it as soon as possible. Currently no API key is needed for access. However, a key might be needed in the future.

[Version 1 URL](https://solar-garden-be.herokuapp.com/api/v1): ```https://solar-garden-be.herokuapp.com/api/v1```

## Repos
For access to all the repos that make up the Service Oriented Architecture of this application please visit our [origanization page](https://github.com/My-Solar-Garden).

## Summary
  - [User Endpoints](#user-endpoints)
    - [GET All users](#get-users---all-users)
    - [GET One user](#get-usersid---specific-user)
    - [POST Create user](#post-users---create-user)
    - [PATCH Update user](#patch-usersid---update-user)
    - [DELETE Destroy user](#delete-usersid---delete-user)
  - [Garden Endpoints](#garden-endpoints)
    - [GET All gardens](#get-gardens---all-gardens)
    - [GET One garden](#get-gardensid---specific-garden)
    - [POST Create garden](#post-gardens---create-garden)
    - [PATCH Update garden](#patch-gardensid---update-garden)
    - [DELETE Destroy garden](#delete-gardensid---delete-garden)
  - [Plant Endpoints](#plant-endpoints)
    - [GET All plants](#get-plants---all-plants)
    - [GET One plant](#get-plantsid---specific-plant)
    - [POST Create plant](#post-plants---create-plant)
    - [PATCH Update plant](#patch-plantsid---update-plant)
    - [DELETE Destroy plant](#delete-plantsid---delete-plant)
    - [DELETE Destroy garden](#delete-gardensid---delete-garden)
  - [Sensor Endpoints](#sensor-endpoints)
    - [GET All sensors](#get-sensors---all-sensors)
    - [GET One sensor](#get-sensorsid---specific-sensor)
    - [POST Create sensor](#post-sensors---create-sensor)
    - [PATCH Update sensor](#patch-sensorsid---update-sensor)
    - [DELETE Destroy sensor](#delete-sensorsid---delete-sensor)
  - [Garden Health Endpoints](#garden-health-endpoints)
    - [GET All garden health](#get-garden_healths---all-garden-health)
    - [GET One garden health](#get-garden_healthsid---specific-garden-health)
    - [POST Create garden health](#post-garden_health---create-garden-health)
    - [PATCH Update garden health](#patch-garden_healthsid---update-garden-health)
    - [DELETE Destroy garden health](#delete-garden_healthsid---delete-garden-health)
  - [Weather Endpoint](#weather-endpoint)
    - [GET Forecast](#get-forcast---return-forecast-for-location)
  - [Search Endpoint](#search-endpoints)
    - [GET Plant search](#get-plantssearch---searching-for-a-plant)
  - [Contributors](#contributors)
  
## User Endpoints

### ```GET /users``` - all users

Returns a JSON list of all users as well as associated relationships.

Note: Relationships may be empty if user is new and has no gardens, sensors, plants, and data.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/users
```

Exmaple Response:
```json
{
    "data": [
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "id": 1,
                "email": "rita@example.com"
            },
            "relationships": {
                "user_gardens": {
                    "data": []
                },
                "gardens": {
                    "data": []
                }
            }
        },
        
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "id": 2,
                "email": "blake@example.com"
            },
            "relationships": {
                "user_gardens": {
                    "data": [
                        {
                            "id": "479",
                            "type": "user_garden"
                        },
                        {
                            "id": "483",
                            "type": "user_garden"
                        }
                    ]
                },
                "gardens": {
                    "data": [
                        {
                            "id": "486",
                            "type": "garden"
                        },
                        {
                            "id": "490",
                            "type": "garden"
                        }
                    ]
                }
            }
        }
    ]
}
```

### ```GET /users/:id``` - specific user

Returns a JSON of one user that matches with ID being passed.

Note: Relationships may be empty if user is new and has no gardens, sensors, plants, and data.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/users/2
```

Exmaple Response:
```json
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "id": 2,
            "email": "blake@example.com"
        },
        "relationships": {
            "user_gardens": {
                "data": [
                    {
                        "id": "479",
                        "type": "user_garden"
                    },
                    {
                        "id": "483",
                        "type": "user_garden"
                    }
                ]
            },
            "gardens": {
                "data": [
                    {
                        "id": "486",
                        "type": "garden"
                    },
                    {
                        "id": "490",
                        "type": "garden"
                    }
                ]
            }
        }
    }
}
```

### ```POST /users``` - create user

Creates a new user. This route is used by oAuth and shouldn't be made manually. You will need to note that the incoming content is json and add the following to the body. Each name/value pair must be filled out. A user will not be created with empty fields.

Example Request:
```
POST https://solar-garden-be.herokuapp.com/api/v1/users
Content-Type: application/json

{
   "credentials":{
      "token": "wkdjw1i79h39rnu2i3"
      "refresh_token": "lko1238u0012inodw" 
   },
   "info":{
      "email": "john@example.com"
   },
   "provider": "google_oauth2",
   "uid": "12312391398532976374823746"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "id": 3,
            "email": "john@example.com"
        },
        "relationships": {
            "user_gardens": {
                "data": []
            },
            "gardens": {
                "data": []
            }
        }
    }
}

```

### ```PATCH /users/:id``` - update user

Updates an existing user. One or more fields can be updated in one request, depending on what is added to the body.

Note: The user's token, refresh_token, provider and uid are not displayed.

Example Request:
```
PATCH https://solar-garden-be.herokuapp.com/api/v1/users/3
Content-Type: application/json

{
   "credentials":{
      token": "5555555555555555"
   },
   "info":{
      "email": "johnny@example.com"
   }
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "id": 3,
            "email": "johnny@example.com"
        },
        "relationships": {
            "user_gardens": {
                "data": []
            },
            "gardens": {
                "data": []
            }
        }
    }
}

```

### ```DELETE /users/:id``` - delete user

Deletes an existing user. The return will be empty with a status code of 204 No Content.

Example Request:
```
DELETE https://solar-garden-be.herokuapp.com/api/v1/users/3
```

Exmaple Response:
```
204 No Content
```

## Garden Endpoints

### ```GET /gardens``` - all gardens

Returns a JSON list of all gardens as well as associated relationships.

Note: Relationships may be empty if garden is new and has no sensors, plants, and data.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/gardens
```

Exmaple Response:
```json
{
    "data": [
        {
            "id": "1",
            "type": "garden",
            "attributes": {
                "latitude": 97.5,
                "longitude": 100.0,
                "name": "Tomato Garden",
                "description": "4x4 grid of red tomatoes",
                "private": false
            },
            "relationships": {
              "user_gardens": {
                  "data": [
                      {
                          "id": "235",
                          "type": "user_garden"
                      }
                  ]
              },
                "users": {
                    "data": [                        {
                            "id": "1",
                            "type": "user"
                        }
                    ]
                },
                "sensors": {
                    "data": [
                        {
                            "id": "3",
                            "type": "sensor"
                        }
                    ]
                },
                "garden_plants": {
                    "data": [
                        {
                            "id": "2",
                            "type": "garden_plant"
                        },
                        {
                            "id": "3",
                            "type": "garden_plant"
                        }
                    ]
                },
                "plants": {
                    "data": [
                        {
                            "id": "33",
                            "type": "plant"
                        },
                        {
                            "id": "33",
                            "type": "plant"
                        }
                    ]
                }
            }
        },
        {
            "id": "2",
            "type": "garden",
            "attributes": {
                "latitude": 71.0,
                "longitude": 25.0,
                "name": "The Grove",
                "description": "A simple garden",
                "private": false
            },
            "relationships": {
                "user_gardens": {
                    "data": [
                        {
                            "id": "480",
                            "type": "user_garden"
                        }
                    ]
                },
                "users": {
                    "data": [                        {
                            "id": "2",
                            "type": "user"
                        }
                    ]
                },
                "sensors": {
                    "data": [
                        {
                            "id": "78",
                            "type": "sensor"
                        },
                        {
                            "id": "79",
                            "type": "sensor"
                        }
                    ]
                },
                "garden_plants": {
                    "data": []
                },
                "plants": {
                    "data": []
                }
            }
        }
    ]
}
```

### ```GET /gardens/:id``` - specific garden

Returns a JSON of one garden that matches with ID being passed.

Note: Relationships may be empty if garden is new and has no sensors, plants, and data.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/gardens/1
```

Exmaple Response:
```json
{
   "data":{
      "id":"1",
      "type":"garden",
      "attributes":{
         "latitude":97.5,
         "longitude":100.0,
         "name":"Tomato Garden",
         "description":"4x4 grid of red tomatoes",
         "private":false
      },
      "relationships":{
         "user_gardens":{
            "data":[
               {
                  "id":"235",
                  "type":"user_garden"
               }
            ]
         },
         "users":{
            "data":[
               {
                  "id":"1",
                  "type":"user"
               }
            ]
         },
         "sensors":{
            "data":[
               {
                  "id":"3",
                  "type":"sensor"
               }
            ]
         },
         "garden_plants":{
            "data":[
               {
                  "id":"2",
                  "type":"garden_plant"
               },
               {
                  "id":"3",
                  "type":"garden_plant"
               }
            ]
         },
         "plants":{
            "data":[
               {
                  "id":"33",
                  "type":"plant"
               },
               {
                  "id":"33",
                  "type":"plant"
               }
            ]
         }
      }
   }
}
```

### ```POST /gardens``` - create garden

Creates a new garden. You will need to note that the incoming content is json and add the following to the body. Each name/value pair must be filled out. A garden will not be created with empty fields.

Example Request:
```
POST https://solar-garden-be.herokuapp.com/api/v1/gardens
Content-Type: application/json

{
   "user_id": "1",
   "longitude": 100.5,
   "latitude": 97.5,
   "name": "Garden",
   "private": false,
   "description": "It's a garden, what else do you want to know?"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "487",
        "type": "garden",
        "attributes": {
            "latitude": 97.5,
            "longitude": 100.5,
            "name": "Garden",
            "description": "It's a garden, what else do you want to know?",
            "private": false
        },
        "relationships": {
            "user_gardens": {
                "data": [
                    {
                        "id": "480",
                        "type": "user_garden"
                    }
                ]
            },
            "users": {
                "data": [
                    {
                        "id": "1",
                        "type": "user"
                    }
                ]
            },
            "sensors": {
                "data": []
            },
            "garden_plants": {
                "data": []
            },
            "plants": {
                "data": []
            }
        }
    }
}
```

### ```PATCH /gardens/:id``` - update garden

Updates an existing garden. One or more fields can be updated in one request, depending on what is added to the body.

Example Request:
```
PATCH https://solar-garden-be.herokuapp.com/api/v1/gardens/487
Content-Type: application/json

{
   "longitude": 101.5,
   "name": "Fab Gar Den"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "487",
        "type": "garden",
        "attributes": {
            "latitude": 97.5,
            "longitude": 101.5,
            "name": "Fab Gar Den",
            "description": "It's a garden, what else do you want to know?",
            "private": false
        },
        "relationships": {
            "user_gardens": {
                "data": [
                    {
                        "id": "480",
                        "type": "user_garden"
                    }
                ]
            },
            "users": {
                "data": [
                    {
                        "id": "1",
                        "type": "user"
                    }
                ]
            },
            "sensors": {
                "data": []
            },
            "garden_plants": {
                "data": []
            },
            "plants": {
                "data": []
            }
        }
    }
}
```

### ```DELETE /gardens/:id``` - delete garden

Deletes an existing garden. The return will be empty with a status code of 204 No Content.

Example Request:
```
DELETE https://solar-garden-be.herokuapp.com/api/v1/gardens/487
```

Exmaple Response:
```
204 No Content
```
## Plant Endpoints

### ```GET /plants``` - all plants

Returns a JSON list of all plants as well as associated relationships.

Note: Relationships may be empty if plant is new or has no gardens it's attached to yet.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/plants
```

Exmaple Response:
```json
{
   "data":[
      {
         "id":"2",
         "type":"plant",
         "attributes":{
            "image":"noimage.jpg",
            "name":"Dandelion",
            "species":"Taraxacum",
            "description":"Dandelion is a plant with yellow flowers. Taraxacum officinale is the most common variety of this plant, and it grows in many parts of the world. Botanists consider dandelions to be herbs. People use the leaves, stem, flower, and root of the dandelion for medicinal purposes.",
            "light_requirements":"They prefer full sun but will do fine in partial shade.",
            "water_requirements":"Dandelions need a lot of water to thrive, so plan to water them regularly. However, do not water them too much. Water just enough so that the soil feels moist. Check the soil by poking your finger into it once every 2 to 3 days.",
            "when_to_plant":"Seeds can be sown anytime from early spring to early fall. In terms of spacing, it is recommended to maintain a spacing of 6-9 inches (15-23 cm.) between plants in rows 12 inches (30 cm.) apart for dandelion seed growing",
            "harvest_time":"No harvest data available for this plant.",
            "common_pests":"Humans are a common pests to dandelions. They often will be sprayed with weed killer or stomped on. Often times the flower will be picked from the dandelion.",
            "id":2
         },
         "relationships":{
            "garden_plants":{
               "data":[

               ]
            },
            "gardens":{
               "data":[

               ]
            }
         }
      },
      {
         "id":"42",
         "type":"plant",
         "attributes":{
            "image":"harvest_helper_production/42_tarragon",
            "name":"Tarragon",
            "species":"",
            "description":"Tarragon is a perennial herb with long, light green leaves and tiny greenish or yellowish white flowers. For cooking, use French tarragon. Russian tarragon can easily be mistaken for French, but Russian tarragon is coarser and less flavorful than French tarragon.",
            "light_requirements":"Full-Part Sun",
            "water_requirements":"Be sure to water the young plants regularly until they are fully grown so that they don't dry out.",
            "when_to_plant":"You can tarragon mint as soon as the soil is workable in the spring.",
            "harvest_time":"Harvest your plant regularly. Two or three plants will suffice if you regularly prune them. Tarragon is best used fresh in the summer.",
            "common_pests":"",
            "id":42
         },
         "relationships":{
            "garden_plants":{
               "data":[
                  {
                     "id":"1",
                     "type":"garden_plant"
                  }
               ]
            },
            "gardens":{
               "data":[
                  {
                     "id":"247",
                     "type":"garden"
                  }
               ]
            }
         }
      }
   ]
}
```

### ```GET /plants/:id``` - specific plant

Returns a JSON of one plant that matches with ID being passed.

Note: Relationships may be empty if plant is new or has no gardens it's attached to yet.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/plants/4
```

Exmaple Response:
```json
{
    "data": {
        "id": "4",
        "type": "plant",
        "attributes": {
            "image": "harvest_helper_production/04_carrot",
            "name": "Carrots",
            "species": "",
            "description": "Carrots are a popular root vegetable that are easy to grow in sandy soil. They are resistant to most pests and diseases, and are a good late season crop that can tolerate frost. Not all carrots are orange; varieties vary in color from purple to white.",
            "light_requirements": "Full Sun(at least 6 hours a day)",
            "water_requirements": "Water at least one inch per week.",
            "when_to_plant": "Plan to plant seeds outdoors 3 to 5 weeks before the last spring frost date.",
            "harvest_time": "Carrots are mature at around 2 ½ months and ½ inch in diameter. You may harvest whenever desired maturity is reached.\r\nYou may leave mature carrots in the soil for storage if the ground will not freeze.",
            "common_pests": "Wireworms, Flea Beetles",
            "id": 4
        },
        "relationships": {
            "garden_plants": {
                "data": [
                    {
                        "id": "16",
                        "type": "garden_plant"
                    }
                ]
            },
            "gardens": {
                "data": [
                    {
                        "id": "247",
                        "type": "garden"
                    }
                ]
            }
        }
    }
}
```

### ```POST /plants``` - create plant

Creates a new plant. You will need to note that the incoming content is json and add the following to the body. Each name/value pair must be filled out. A garden will not be created with empty fields.

Example Request:
```
POST https://solar-garden-be.herokuapp.com/api/v1/plants
Content-Type: application/json

{
   "image": "image.url",
   "name": "plant name",
   "species": "plant species",
   "description": "plant description",
   "light_requirements": "light needed for plant",
   "water_requirements": "water needed for plant",
   "when_to_plant": "when to plant",
   "harvest_time": "time to harvest",
   "common_pests": "common pests for plant"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "69",
        "type": "plant",
        "attributes": {
            "image": "image.url",
            "name": "plant name",
            "species": "plant species",
            "description": "plant description",
            "light_requirements": "light need for plant",
            "water_requirements": "water need for plant",
            "when_to_plant": "when to plant",
            "harvest_time": "time to harvest",
            "common_pests": "common pests for plants",
            "id": 2
        },
        "relationships": {
            "garden_plants": {
                "data": []
            },
            "gardens": {
                "data": []
            }
        }
    }
}
```

### ```PATCH /plants/:id``` - update plant

Updates an existing plant. One or more fields can be updated in one request, depending on what is added to the body.

Example Request:
```
PATCH https://solar-garden-be.herokuapp.com/api/v1/plants/69
Content-Type: application/json

{
   "description": "this plant is awesome",
   "light_requirements": "needs lots of light",
   "common_pests": "humans"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "69",
        "type": "plant",
        "attributes": {
            "image": "image.url",
            "name": "plant name",
            "species": "plant species",
            "description": "this plant is awesome",
            "light_requirements": "needs lots of light",
            "water_requirements": "water need for plant",
            "when_to_plant": "when to plant",
            "harvest_time": "time to harvest",
            "common_pests": "humans",
            "id": 2
        },
        "relationships": {
            "garden_plants": {
                "data": []
            },
            "gardens": {
                "data": []
            }
        }
    }
}
```

### ```DELETE /plants/:id``` - delete plant

Deletes an existing plant. The return will be empty with a status code of 204 No Content.

Example Request:
```
DELETE https://solar-garden-be.herokuapp.com/api/v1/plants/69
```

Exmaple Response:
```
204 No Content
```

## Sensor Endpoints

### ```GET /sensors``` - all sensors

Returns a JSON list of all sensors as well as associated relationships.

Note: Garden health relationship might be empty if a sensor has not yet recorded any data for that garden.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/sensors
```

Exmaple Response:
```json
{
    "data": [
        {
            "id": "86",
            "type": "sensor",
            "attributes": {
                "min_threshold": 5,
                "max_threshold": 100,
                "sensor_type": "moisture"
            },
            "relationships": {
                "garden": {
                    "data": {
                        "id": "7",
                        "type": "garden"
                    }
                },
                "garden_healths": {
                    "data": []
                }
            }
        },
        {
            "id": "92",
            "type": "sensor",
            "attributes": {
                "min_threshold": 1,
                "max_threshold": 100,
                "sensor_type": "light"
            },
            "relationships": {
                "garden": {
                    "data": {
                        "id": "488",
                        "type": "garden"
                    }
                },
                "garden_healths": {
                    "data": [
                        {
                            "id": "56",
                            "type": "garden_health"
                        },
                        {
                            "id": "59",
                            "type": "garden_health"
                        },
                        {
                            "id": "60",
                            "type": "garden_health"
                        },
                        {
                            "id": "61",
                            "type": "garden_health"
                        }
                    ]
                }
            }
        }
    ]
}
```

### ```GET /sensors/:id``` - specific sensor

Returns a JSON of one sensor that matches with ID being passed.

Note: Garden health relationship might be empty if a sensor has not yet recorded any data for that garden.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/sensors/101
```

Exmaple Response:
```json
{
    "data": {
        "id": "101",
        "type": "sensor",
        "attributes": {
            "min_threshold": 6,
            "max_threshold": 7,
            "sensor_type": "light"
        },
        "relationships": {
            "garden": {
                "data": {
                    "id": "248",
                    "type": "garden"
                }
            },
            "garden_healths": {
                "data": [
                    {
                        "id": "62",
                        "type": "garden_health"
                    }
                ]
            }
        }
    }
}
```

### ```POST /sensors``` - create sensor

Creates a new sensor. You will need to note that the incoming content is json and add the following to the body. Each name/value pair must be filled out. A garden will not be created with empty fields.

Note: sensor_type is an enum and related to a value (0 = moisture, 1 = light, 2 = temperature)

Example Request:
```
POST https://solar-garden-be.herokuapp.com/api/v1/sensors
Content-Type: application/json

{
   "min_threshold": 5,
   "max_threshold": 14,
   "sensor_type": 2,
   "garden_id": "7"
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "99",
        "type": "sensor",
        "attributes": {
            "min_threshold": 5,
            "max_threshold": 14,
            "sensor_type": "temperature"
        },
        "relationships": {
            "garden": {
                "data": {
                    "id": "7",
                    "type": "garden"
                }
            },
            "garden_healths": {
                "data": []
            }
        }
    }
}
```

### ```PATCH /sensors/:id``` - update sensor

Updates an existing sensor. One or more fields can be updated in one request, depending on what is added to the body.

Note: sensor_type is an enum and related to a value (0 = moisture, 1 = light, 2 = temperature)


Example Request:
```
PATCH https://solar-garden-be.herokuapp.com/api/v1/sensors/99
Content-Type: application/json

{
   "min_threshold": 2,
   "max_threshold": 15,
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "99",
        "type": "sensor",
        "attributes": {
            "min_threshold": 2,
            "max_threshold": 15,
            "sensor_type": "temperature"
        },
        "relationships": {
            "garden": {
                "data": {
                    "id": "7",
                    "type": "garden"
                }
            },
            "garden_healths": {
                "data": []
            }
        }
    }
}
```

### ```DELETE /sensors/:id``` - delete sensor

Deletes an existing sensor. The return will be empty with a status code of 204 No Content.

Example Request:
```
DELETE https://solar-garden-be.herokuapp.com/api/v1/sensors/99
```

Exmaple Response:
```
204 No Content
```
## Garden Health Endpoints

### ```GET /garden_healths``` - all garden health

Returns a JSON list of all garden health data for all gardens.

Note: Query is not limited and may return large payload.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/garden_healths
```

Exmaple Response:
```json
{
    "data": [
        {
            "id": "57",
            "type": "garden_health",
            "attributes": {
                "id": 57,
                "reading_type": "moisture",
                "reading": 99.0,
                "created_at": "2020-11-04T00:00:00.000Z"
            }
        },
        {
            "id": "56",
            "type": "garden_health",
            "attributes": {
                "id": 56,
                "reading_type": "light",
                "reading": 700.0,
                "created_at": "2020-11-05T00:00:00.000Z"
            }
        },
        {
            "id": "57",
            "type": "garden_health",
            "attributes": {
                "id": 62,
                "reading_type": "light",
                "reading": 700.0,
                "created_at": "2020-11-04T00:00:05.000Z"
            }
        }
    ]
}
```

### ```GET /garden_healths/:id``` - specific garden health

Returns a JSON of one garden health data plot.

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/garden_healths/62
```

Exmaple Response:
```json
{
    "data": {
        "id": "62",
        "type": "garden_health",
        "attributes": {
            "id": 62,
            "reading_type": "light",
            "reading": 700.0,
            "created_at": "2020-11-04T00:00:05.000Z"
        }
    }
}
```

### ```POST /garden_health``` - create garden health

Create new data for garden health data. Sensor ID, reading type, reading are all required fields. The date and time are automatically recorded when data is created. However, there is a time of reading field which is optional. This is in case the reading was taken manually and at a different date/time than creation of data plot.

Note: sensor_type is an enum and related to a value (0 = moisture, 1 = light, 2 = temperature)

Example Request:
```
POST https://solar-garden-be.herokuapp.com/api/v1/sensors
Content-Type: application/json

{
   "sensor_id": "5",
   "reading_type": 0,
   "reading": 123.456
   "time_of_reading": "13:00" #optional
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "55",
        "type": "garden_health",
        "attributes": {
            "id": 55,
            "reading_type": "moisture",
            "reading": 123.456,
            "created_at": "2020-10-29T22:59:56.825Z"
        }
    }
}
```

### ```PATCH /garden_healths/:id``` - update garden health

Updates existing data for garden health. Update some or all variables based on what is entered in the body.

Note: sensor_type is an enum and related to a value (0 = moisture, 1 = light, 2 = temperature)

Example Request:
```
PATCH https://solar-garden-be.herokuapp.com/api/v1/garden_healths/55
Content-Type: application/json

{
   "reading": 24.40
   "time_of_reading": "13:00" #optional
}
```

Exmaple Response:
```json
{
    "data": {
        "id": "55",
        "type": "garden_health",
        "attributes": {
            "id": 55,
            "reading_type": "moisture",
            "reading": 24.40,
            "time_of_reading": "13:00",
            "created_at": "2020-10-29T22:59:56.825Z"
        }
    }
}
```

### ```DELETE /garden_healths/:id``` - delete garden health

Deletes an existing garden health data plot. The return will be empty with a status code of 204 No Content.

Example Request:
```
DELETE https://solar-garden-be.herokuapp.com/api/v1/garden_healths/55
```

Exmaple Response:
```
204 No Content
```

## Weather Endpoint

### ```GET /forecast``` - return forecast for location

Returns a JSON of current weather information based on coordinates.

Note: GPS coordinates must be entered in as params with request (lat = latitude and lon = longitude)

Example Request:
```
GET https://solar-garden-be.herokuapp.com/api/v1/forecast?lat=39.7392&lon=104.9903
```

Exmaple Response:
```json
{
    "data": {
        "id": null,
        "type": "weather",
        "attributes": {
            "id": null,
            "description": "clear sky",
            "humidity": 81,
            "temperature": 28.71,
            "daily": [
                {
                    "date": "2020-11-06T04:00:00.000+00:00",
                    "temperature": 38.41,
                    "humidity": 60,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-07T04:00:00.000+00:00",
                    "temperature": 42.4,
                    "humidity": 50,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-08T04:00:00.000+00:00",
                    "temperature": 46.89,
                    "humidity": 43,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-09T04:00:00.000+00:00",
                    "temperature": 46.4,
                    "humidity": 45,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-10T04:00:00.000+00:00",
                    "temperature": 44.55,
                    "humidity": 52,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-11T04:00:00.000+00:00",
                    "temperature": 49.17,
                    "humidity": 43,
                    "description": "few clouds"
                },
                {
                    "date": "2020-11-12T04:00:00.000+00:00",
                    "temperature": 48.38,
                    "humidity": 38,
                    "description": "clear sky"
                },
                {
                    "date": "2020-11-13T04:00:00.000+00:00",
                    "temperature": 48.52,
                    "humidity": 38,
                    "description": "clear sky"
                }
            ]
        }
    }
}
```
## Search Endpoints

### ```GET /plants/search``` - searching for a plant
Returns a JSON list of plants that contain the search term (partial or complete). The search term must be added as a query. See example.

Example Request:
Searching for any plants with 'on' in the name.
```
GET https://plants-api-2006.herokuapp.com/api/v1/plants/search?search_term=on
```
Exmaple Response:
```json
[
    {
        "id": 18,
        "name": "Onion",
        "description": "Onions are a cold-season crop, easy to grow because of their hardiness. We recommend using onion sets, which can be planted without worry of frost damage and have a higher success rate than direct seed or transplants. Onions grow well on raised beds or raised rows at least 4 inches high.",
        "optimal_sun": "Full Sun(at least 6 hours a day)",
        "optimal_soil": "Neutral pH",
        "planting_considerations": "Select a location with full sun where your onions won't be shaded by other plants. Soil needs to be well-drained, loose, and rich in nitrogen; compact soil affects bulb development.",
        "when_to_plant": "Plant onions as soon as the ground can be worked in the spring, usually late March or April. Make sure temperature doesn’t go below 20 degrees F.",
        "growing_from_seed": "Seeding? Onion seeds are short-lived. If planting seeds indoors, start with fresh seeds each year. Start seeds indoors about 6 weeks before transplanting.",
        "transplanting": "Think of onions as a leaf crop, not a root crop. When planting onion sets, don’t bury them more than one inch under the soil; if more than the bottom third of the bulb is underground, bulb growth can be restricted.",
        "spacing": "Final spacing should be 4-5 inches between each plant and in rows 12-18 inches apart.",
        "watering": "Generally, onions do not need consistent watering if mulch is used. About one inch of water per week (including rain water) is sufficient. If you want sweeter onions, water more. Onions will look healthy even if they are bone dry, be sure to water during drought conditions.",
        "feeding": "Fertilize every few weeks with nitrogen to get big bulbs. Cease fertilizing when the onions push the soil away and the bulbing process has started. Do not put the soil back around the onions; the bulb needs to emerge above the soil.",
        "other_care": "Make sure soil is well-drained. Mulch will help retain moisture and stifle weeds. Cut or pull any onions that send up flower stalks; this means that the onions have “bolted” and are done. When onions start to mature, the tops become yellow and begin to fall over. At that point, bend the tops down or even stomp on them to speed the final ripening process.",
        "diseases": "n/a",
        "pests": "Onion Maggots",
        "harvesting": "When tops are brown, pull the onions. Be sure to harvest in late summer, before cool weather. Mature onions may spoil in fall weather.",
        "storage_use": "Allow onions to dry for several weeks before you store them in a root cellar or any other storage area. Spread them out on an open screen off the ground to dry. Store at 40 to 50 degrees F (4 to 10 degrees C) in braids or with the stems broken off. Mature, dry-skinned bulbs like it cool and dry, so don't store them with apples or potatoes.",
        "image_url": "harvest_helper_production/18_onion"
    },
    {
        "id": 42,
        "name": "Tarragon",
        "description": "Tarragon is a perennial herb with long, light green leaves and tiny greenish or yellowish white flowers. For cooking, use French tarragon. Russian tarragon can easily be mistaken for French, but Russian tarragon is coarser and less flavorful than French tarragon.",
        "optimal_sun": "Full-Part Sun",
        "optimal_soil": "Loamy, Sandy",
        "planting_considerations": "Tarragon is a good companion to most vegetables in the garden.",
        "when_to_plant": "You can tarragon mint as soon as the soil is workable in the spring.",
        "growing_from_seed": "You can’t grow French tarragon from seeds. You must purchase the plants or take an established plant from a friend’s garden. Get the transplants in the spring or fall.",
        "transplanting": "Plant the transplants in well-drained soil about 2 to 3 feet apart in order to give each plant room to grow. A full-grown plant should cover about 12 inches of soil.",
        "spacing": "The plants should grow to around 2 or 3 feet in height. Plant spacing should be around 2-3 feet in all directions.\n",
        "watering": "Be sure to water the young plants regularly until they are fully grown so that they don't dry out.",
        "feeding": "n/a",
        "other_care": "Be sure to prune/harvest the plant regularly to prevent flowering and to keep the height to around 2 feet (otherwise the plant will fall over). If you live in a colder climate, be sure to put mulch around the plants in late fall in order to protect the roots during the winter. To help keep your plants healthy, divide them every 3 to 4 years in the spring or fall. New plants can grow from stem cuttings or root cuttings.",
        "diseases": "Many rusts, including white rust, Downy mildew, Powdery mildew",
        "pests": null,
        "harvesting": "Harvest your plant regularly. Two or three plants will suffice if you regularly prune them. Tarragon is best used fresh in the summer.",
        "storage_use": "You can freeze the leaves or dry them. If left to dry for too long, though, the leaves lose their flavor, so be careful. As soon as the leaves are dry, store them in airtight containers.",
        "image_url": "harvest_helper_production/42_tarragon"
    },
    {
        "id": 33,
        "name": "Watermelon",
        "description": "Everyone seems to love juicy watermelon in the summertime. Native to Africa, melons need warm temperatures (up to 80 degrees during the day) and a long growing season. Gardeners in colder climates can still have success in growing watermelon by starting seeds indoors and choosing short-season varieties. Days to maturity range from 70 to 90, depending on the variety.",
        "optimal_sun": "Full Sun(at least 6 hours a day)",
        "optimal_soil": "Loamy",
        "planting_considerations": "Amend soil with aged manure, seaweed, and/or compost before planting. Watermelons are heavy feeders. Watermelons prefer a soil pH between 6 and 6.8.",
        "when_to_plant": "Watermelon vines are very tender and should not be transplanted until all danger of frost has passed. (To be safe, wait at least two weeks past your last frost date.) If you are in a cooler zone, start seeds indoors about a month before transplanting.",
        "growing_from_seed": "If you live in warmer climates, you can direct sow seeds outdoors, but wait until the soil temperature warms to at least 70 degrees to avoid poor germination.",
        "transplanting": "Transplant at least two weeks past the last frost date of spring.  After you transplant, cover the plants with row covers to keep pests at bay. You'll remove the row covers when you see both male and female flowers on the vine.",
        "spacing": "Growing the vines in raised rows, known as hills, ensures good drainage and will hold the sun’s heat longer. Space the plants about 2 feet apart in a 5-foot-wide hill. If you're growing in rows, space 6 feet apart by 6 feet apart. ",
        "watering": "Watering is very important from planting until fruit begins to form. While melon plants are growing, blooming, and setting fruit, they need 1 to 2 inches of water per week. Keep soil moist but not waterlogged. Water at the vine's base in the morning, and try to avoid wetting the leaves and avoid overhead watering. Reduce watering once fruit are growing. Dry weather produces the sweetest melon.",
        "feeding": "If you choose to fertilize (and many do), make sure it's deliver more nitrogen than phosphorus and potassium. However, after flowering begins, use a fertilizer with less nitrogen. We like to use liquid seaweed.",
        "other_care": "Mulching with black plastic will serve multiple purposes: it will warm the soil, hinder weed growth and keep developing fruits clean. Pruning isn't necessary, but vine productivity may be improved if you do not allow lateral (side) vines to grow and stick to the main vine. When the plant is young, just cut off the end buds as they form (before the side shoots become vines). You can also pinch off some blossoms to focus the energy on fewer melons (though it's a challenge to kill off a potential fruit!). As fruit is ripening, prevent rotting by gently lifting it and putting some cardboard or straw between the fruit and the soil.",
        "diseases": "Aphids, Squash Borers",
        "pests": "Fusarium Wilt",
        "harvesting": "Watermelons don’t sweeten after they are picked, so harvest time is important. They generally ripen over two weeks so keep you eye on them. Check the tendril. If it's green, wait. If it’s half-dead, the watermelon is nearly ripe or ripe. If the tendril is fully dead, it's ripe or overripe; it’s not going to get any riper, so you might as well pick! Stems should be cut with a sharp knife close to the fruit.",
        "storage_use": "Watermelons can be stored uncut for about 10 days. If cut, they can last in the refrigerator for about 4 days. Wrap tightly in plastic.",
        "image_url": "harvest_helper_production/33_watermelon"
    }
]
```

## Contributors
* Alex Desjardins
    * [Link](https://github.com/moosehandlr)
    * [LinkedIn](https://www.linkedin.com/in/alex-desjardins-59297b8b/)
* Angela Guardia
    * [GitHub](https://github.com/AngelaGuardia)
    * [LinkedIn](https://www.linkedin.com/in/angela-guardia/)
* Danielle Coleman
    * [GitHub](https://github.com/dcoleman21)
    * [LinkedIn](https://www.linkedin.com/in/danielle-coleman-86ab3b13/)
* Daniel Lessenden
    * [GitHub](https://github.com/D-Lessenden)
    * [LinkedIn](https://www.linkedin.com/in/lessenden/)
* Drew Williams
    * [GitHub](https://github.com/drewwilliams5280)
    * [LinkedIn](https://www.linkedin.com/in/drewwilliams5280/)
* Eric Hale
    * [GitHub](https://github.com/EHale64)
    * [LinkedIn](https://www.linkedin.com/in/eric-hale-656843155/)
* Hashim Gari
    * [GitHub](https://github.com/hashmaster3k)
    * [LinkedIn](https://www.linkedin.com/in/hashim-gari/)
* Leah Riffell
    * [GitHub](https://github.com/leahriffell)
    * [LinkedIn](https://www.linkedin.com/in/leah-riffell/)
* Logan Riffell
    * [GitHub](https://github.com/lkriffell)
    * [LinkedIn](https://www.linkedin.com/in/logan-riffell/)
* Luke Hunter James-Erickson
    * [GitHub](https://github.com/LHJE)
    * [LinkedIn](https://www.linkedin.com/in/luke-hunter-james-erickson-b65682143/)
* Nico Rithner 
    * [GitHub](https://github.com/nicorithner)
    * [LinkedIn](https://www.linkedin.com/in/nicorithner/)
* Norma Lopez 
    * [GitHub](https://github.com/IamNorma)
    * [LinkedIn](https://www.linkedin.com/in/norma-lopez/)
* Roberto Rodriguez 
    * [GitHub](https://github.com/robertorodriguez12)
    * [LinkedIn](https://www.linkedin.com/in/roberto-j-rodriguez12/)

