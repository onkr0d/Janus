# Janus
This project is a natural extension of previous game/screen-time limiting projects, but cranked up to 100. It blocks specified apps based on a third party's discretion (a trusted individual), kind of like parental controls, but cooler.

# Parts
There are essentially three parts that work together to ensure this project functions.
Here is a general [visualized model]( https://whimsical.com/embed/UXPT9iaSz9H1WuoAvALEfA) of the architecture.

## Server
Perhaps the one of the most important parts, it is the middle-man between clients and apps. It stores a centrally accessible current gaming status, which dictates if it is gaming time or not.
It can be updated only by one app (not in MVP), but accessed by anyone. It is hosted on the AWS cloud.

## Client
The most important component - the client side app. Running on the king's PC, it synchronizes it's gaming status to the server, and moderates the launch of 
game apps. If a game is launched while the current status is false, then it kills the launched app. It will also notify the user that it is not gaming time (not in MVP).

## App
An app that allows the updating of gaming status to the server. It strictly syncs to the server on launch (not in MVP), and allows literally two buttons to update state.
