# DogAPI
An API where users can fetch information about dogs, along with adding and updating information.

Specifics:

The service will be an API service with CRUD Operations( Create, Read, Update, Delete). Users can read information about dogs, create a new dogs entry and delete old entries. The following information should be stored about the dogs:
- Breed(Siberian)
- Life-span (eg.15)
- Size (accepted values: short, medium, long)
- Friendliness (accepted values, hostile, neurtal, friendly)

Users would hit this service via http requests, with expected responses. Read will search based on breed, based on a query string e.g dogservice.com/search?breed=shiba.
Updating and creating should have input validation to ensure data is correct. Here are the rules:
- Breed must be alphabetic characters only (no numbers)
- Life span must be number 
- All other fields (size, hair, friendliness) must be one of their respective accepted values.
- If any of these rules fails, return a client error with an indication of the issue in the response body.
- This service must be hosted in AWS, the way in which it is hosted up to you, but it must allow you to run the service with the above features and be reasonably performant and cost effective.


Stack
API Gateway - routes to appropriate lambda for processing depending on path and method

Lambda - Processed each event

DynamoDB - Stores records on dogs


Table Structure
Primary Key - Breed

Data 
![DogAPI](https://user-images.githubusercontent.com/19194352/123122836-5840ac80-d414-11eb-9217-c3075cd9c493.PNG)

size

Lambdas
Written in Go, just for experience
Core libraries in a layer, lambdas just have code to invoke shared libraries
