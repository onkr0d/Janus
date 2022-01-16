# JanusServer
The server part of the Janus project.

## Functionality
The server provides the communication between the app and the client. It stores current gaming status, and initializes to last known status (not in MVP). It has two endpoints,
``/ask``, which allows anyone to make a GET request for the current gaming status. ``/update`` allows for updating the current gaming status, authenticated using JWT (not in MVP).
