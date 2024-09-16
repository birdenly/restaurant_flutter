# Restaurant flutter
Restaurant app using flutter utilizing state management Provider, HTTP package integrated with Firebase back-end, integration with google maps API, base64 (to encode/decode images) and native resources from phones with packages like location, geocoding and image_picker

--------------------------
## What the app does
The app is divided in 2 parts admin and client, they are divided by login accounts with 1 hardcoded admin and all clients are added through the firebase database. Clients can register through the first page of the app.

Clients will be able to see the whole menu, add whatever they want to a virtual cart, than go to checkout, there they can increase the amout of items and delete them from the cart. When they are ready they can go into a new screen to pay for what they want, where everything will be listed than given a total amout. In the same page they can select they location with the location native resource and google maps API.

Admin will be able to do all the above and have special pages to add items to the list (they will all go to the firebase database) and a page to remove a user from the database.

--------------------------
### Most used in this repo:
 - Flutter
 - Provider
 - HTTP package
 - Firebase
 - google maps API
 - base64
 - native resources (location, geocoding, image_picker)
