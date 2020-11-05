# Solar Garden Backend API
![](https://img.shields.io/badge/version-1.0-orange)
![](https://img.shields.io/badge/Rails-5.2.4.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
![](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
[![Build Status](https://travis-ci.com/My-Solar-Garden/rails_backend.svg?branch=main)](https://travis-ci.com/My-Solar-Garden/rails_backend)

Welcome to the backend API for [My Solar Garden](https://github.com/My-Solar-Garden/front_end_rails) web application. If you need help or have a problem, please submit an issue and one of our team members will get to it as soon as possible. Currently no API key is needed for access. However, a key might be needed in the future.

Version 1 URL: ```https://solar-garden-be.herokuapp.com/api/v1```

## Summary
  - [User Endpoints](#user-endpoints)
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

