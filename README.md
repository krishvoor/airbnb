[![Docker Repository on Quay](https://quay.io/repository/krvoora/airbnb/status "Docker Repository on Quay")](https://quay.io/repository/krvoora/airbnb)
## Introduction

This document describes how to deploy a cloud-native application on Openshift Container Platform, expose its endpoints to simulate user(s) querying nearest vacation/ workation or staycation properties.

## Prerequisites

- Should have OCP 4.10 or equivalent Kubernetes 
- The images are staged here quay.io/krvoora/airbnb:latest

## Configuration

#### Instructions to deploy the application ####
Create a New Project

```
export NAMESPACE=perfscale
oc new-project $NAMESPACE
```

Git clone the project

```
git clone https://github.com/krishvoor/airbnb
cd airbnb/deployment
```

Deploy the application

```
oc create -f airbnb.yaml
```

This should expose your route as well, to validate perform

```
oc get route
```

## Document(s) view

This is how a document in Listing collection would look like

```
  {
    "_id": {
      "$oid": "62cd3db1280d25eba9005f9d"
    },
    "listing_id": 23726706,
    "date": "2022-06-05",
    "available": "f",
    "price": "$90.00",
    "adjusted_price": "$90.00",
    "minimum_nights": 2,
    "maximum_nights": 1125
  }
```

This is how a document in Reviews collection would look like

```  
{
    "_id": {
      "$oid": "62cd3df24a35217acb0dd3c2"
    },
    "listing_id": 23726706,
    "id": 248833758,
    "date": "2018-04-01",
    "reviewer_id": 155953524,
    "reviewer_name": "Ayme",
    "comments": "Una Excelente estancia en casa de Patricia y su esposo Dik ! <br/>La casa está muy limpia , bien comunicada con el transporte público y el desayuno muy rico.<br/>Patricia y Dik nos ayudaron en todo lo que ocupamos y el primer día fueron por nosotros a la central del metro.<br/>Sin duda alguna regresaría y lo recomiendo plenamente !!"
  }
  ```


This is how a document in Listing collection would look like

```
{
    "_id": {
        "$oid": "62cd3da10f0d50c3133c3f9f"
        },
        "id": 23726706,
        "listing_url": "https://www.airbnb.com/rooms/23726706",
        "scrape_id": 20220605131734,
        "last_scraped": "2022-06-05",
        "name": "Private room 20 minutes from Amsterdam + Breakfast",
        "description": "Cousy  private room 20 min. from Amsterdam. Shared bathroom, Tea and coffee available in the room. Lock on the door, Bed 160x200. We enjoy giving info about Amsterdam or other site seeing places. We serve a nice breakfast downstairs. Bus stops 1 min. from the house, 7 min to train. Train takes 10 min to center. Breakfast makes a difference for our guests to start off the day full of energy. We are interested in what you do or don’t eat and act accordingly. Please book correct amount of guests !<br /><br /><b>The space</b><br />Our home is situated close to the Amsterdam Rijnkanaal. If you like walking or bike riding, it is a nice area. But also by bus and train within 20 minutes in the Centrum of Amsterdam (central station)<br />The Bathroom has a shower, no bath present ! You must be able to climb stairs, for the room is situated on the first floor.<br /><br /><b>Guest access</b><br />If you would like to use our kitchen, refrigerator or other rooms in the house, please ask for the po",
        "neighborhood_overview": "We live in a nice Cousy and clean house with enough room to move around. The stores are 5 minutes walk, bus 1 minute and takes 7 minutes to the station or a 15 minutes walk. You can also take a walk by the Amsterdam-Rijnkanaal or in the park. We like the fact that it is a quiet place but if we want to visite the busy city, it only takes 10 minutes by train or 20 minutes by bike to Rembrandtplein.",
        "picture_url": "https://a0.muscache.com/pictures/eb6d6636-02d6-4492-af1b-01744e1abdf8.jpg",
        "host_id": 122619127,
        "host_url": "https://www.airbnb.com/users/show/122619127",
        "host_name": "Patricia",
        "host_since": "2017-03-26",
        "host_location": "Diemen, North Holland, Netherlands",
        "host_about": "Hi, Welcome. we are so glade we are able to open our place again, starting march 2022.\nMy name is Patricia, born in California but I have been living in Holland since my 11th. I am married to Dik and he was born and raised in Amsterdam. We have a lovely home in Diemen and love to share it with guests and enjoy helping our guests to find their way around Amsterdam. Although we believe that Holland is more than that. We love to tell about the lifestyle of dutch people.\nAre you interested in a dutch experience with people that do what they love, and are proud of their home. I know for sure you won't regret it !!! \nWe also have extra services we can help you with.\nSee you soon.",
        "host_response_time": "within an hour",
        "host_response_rate": "100%",
        "host_acceptance_rate": "95%",
        "host_is_superhost": "f",
        "host_thumbnail_url": "https://a0.muscache.com/im/pictures/user/52706505-6393-44d1-a3e4-8aea9d320a67.jpg?aki_policy=profile_small",
        "host_picture_url": "https://a0.muscache.com/im/pictures/user/52706505-6393-44d1-a3e4-8aea9d320a67.jpg?aki_policy=profile_x_medium",
        "host_neighbourhood": "",
        "host_listings_count": 1,
        "host_total_listings_count": 1,
        "host_verifications": "['email', 'phone', 'work_email']",
        "host_has_profile_pic": "t",
        "host_identity_verified": "t",
        "neighbourhood": "Diemen, Noord-Holland, Netherlands",
        "neighbourhood_cleansed": "IJburg - Zeeburgereiland",
        "neighbourhood_group_cleansed": "",
        "latitude": 52.34916,
        "longitude": 4.97879,
        "property_type": "Private room in home",
        "room_type": "Private room",
        "accommodates": 2,
        "bathrooms": "",
        "bathrooms_text": "1 shared bath",
        "bedrooms": 1,
        "beds": 1,
        "amenities": "[\"Carbon monoxide alarm\", \"Dishes and silverware\", \"Fire extinguisher\", \"Wifi\", \"Coffee maker\", \"Essentials\", \"Heating\", \"Hot water\", \"Shampoo\", \"Breakfast\", \"Hangers\", \"Lock on bedroom door\", \"Dedicated workspace\", \"Free street parking\", \"Smoke alarm\", \"Free parking on premises\", \"TV\", \"Backyard\", \"Hair dryer\", \"Washer\", \"Host greets you\", \"First aid kit\", \"Dryer\", \"Iron\", \"Luggage dropoff allowed\"]",
        "price": "$88.00",
        "minimum_nights": 2,
        "maximum_nights": 14,
        "minimum_minimum_nights": 2,
        "maximum_minimum_nights": 2,
        "minimum_maximum_nights": 1125,
        "maximum_maximum_nights": 1125,
        "minimum_nights_avg_ntm": 2,
        "maximum_nights_avg_ntm": 1125,
        "calendar_updated": "",
        "has_availability": "t",
        "availability_30": 0,
        "availability_60": 6,
        "availability_90": 20,
        "availability_365": 66,
        "calendar_last_scraped": "2022-06-05",
        "number_of_reviews": 78,
        "number_of_reviews_ltm": 11,
        "number_of_reviews_l30d": 3,
        "first_review": "2018-03-26",
        "last_review": "2022-05-29",
        "review_scores_rating": 4.99,
        "review_scores_accuracy": 4.96,
        "review_scores_cleanliness": 4.97,
        "review_scores_checkin": 4.95,
        "review_scores_communication": 4.97,
        "review_scores_location": 4.73,
        "review_scores_value": 4.87,
        "license": "038469D9AA6BDF1142CE",
        "instant_bookable": "t",
        "calculated_host_listings_count": 1,
        "calculated_host_listings_count_entire_homes": 0,
        "calculated_host_listings_count_private_rooms": 1,
        "calculated_host_listings_count_shared_rooms": 0,
        "reviews_per_month": 1.53
    }
}
```