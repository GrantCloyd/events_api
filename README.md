# README - Events API

This API is designed by Grant Cloyd based on specifications from CareRev.

## Version details

-  Ruby (version: 2.7.4)
-  Rails (version: 6.1.4)
-  Active Model Serializers (version: 0.10.12)

## Post endpoint for events

Can be accessed at ... herokuapp.com/events

To POST an event using JSON, two key/value pairs are required - name and event_type. The event_type key must also be one of the following: click, view, login, exit, share, sign up, payment, refund, search, or custom.

Additional parameters can be added when POSTing a new event, and are returned as a JSON object upon successful completion.

Example post:

```
{"event" : {"name" : "CareRev", "event_type" : "view", "page" : "home", "time_spent" : 12 }}
```

Will respond with a 201 status and a JSON object:

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

## Today Stats endpoint

This endpoint can be located at ... herokuapp.com/todaystats

Endpoint will return a json object containing all the events received today (determined by user time zone), grouped by event_type and providing the count for each. Example response:

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

## To Test

```
-X POST --header 'Content-Type: application/json' --data '{"event" : {"name" : "test button", "event_type" : "click", "at" : "2020-06-12T00:00:01", "button_color" : "red" }}' 'https://some-custom-name.herokuapp.com/events'
```
