# README - Events API

This API is designed by Grant Cloyd based on specifications from CareRev. It is hosted at https://eventscarerev.herokuapp.com 

## Version details

-  Ruby (version: 2.7.4)
-  Rails (version: 6.1.4)
-  Active Model Serializers (version: 0.10.12)

## POST Endpoint for Event Creation

Can be accessed by using https://eventscarerev.herokuapp.com/events

To POST an event using JSON, two key/value pairs are required - name and event_type. The event_type key must also be one of the following: click, view, login, exit, share, sign up, payment, refund, search, or custom.

Additional parameters can be added when POSTing a new event, and are returned as a JSON object upon success.

Example post:

```
{"event" : {"name" : "CareRev", "event_type" : "view", "page" : "home", "time_spent" : 12 }}
```

This will respond with a 201 status and a JSON object:

```
{
    "id": 1,
    "name": "CareRev",
    "event_type": "view",
    "additional_information": {
        "page": "home",
        "time_spent": 12
    }
}
```

If no additional key/value pairs are supplied, the additional_information key will return an empty object.

```
"additional_information": {}
```

### To Test POST

```
curl -X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "test button", "event_type" : "click", "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' 'https://eventscarerev.herokuapp.com/events'
```


## Today Stats Endpoint

This endpoint can be accessed at https://eventscarerev.herokuapp.com/todaystats

Endpoint will return a json object containing all the events received today (determined by user time zone), grouped by event_type, and provide the count for each type. Example response:

```
{
    todays_stats: [
      {
        login: 8
      },
      {
        view: 1
      }
   ]
}
```


### To test Today Stats

```
curl -X GET https://eventscarerev.herokuapp.com/todaystats
```
