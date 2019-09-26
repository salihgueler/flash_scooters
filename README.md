# Flash Scooters

It's a simple application to show some scooter positions fetched from backend. In application,
the user can click on the Scooter markers and learn about the status of it. 

For using it, you are required to have an API key for Google Maps.

## What has been implemented?

### Feature
- A loading page is implemented for the loading part of the data. It uses Flare for the
loading animation and a regular Text widget for the text.
- Google Maps SDK for Flutter is implemented. 
- Information about the Scooters is retrieved from the provided url.
- Retrieved Scooter information is:
    1. Used to create markers on the application with the location retrieved from it
    2. Used for showing information in the Card with the information details.
    3. Used for showing all the markers on the initial load.
- Provider and Consumer is used to pass the data and handle the Marker state. 
- Information retrieved from the backend had lack of documentation. Therefore I thought about what
they might mean from my experiences with the other scooter apps. I composed the views with the meanings that most like mean:
    1. Description and name properties of the scooter are combined and a single text created.
    2. A percentage sign is added to battery level property and a icon selection logic is added to show different icons when 
    the battery is in the critical level (which is 20 percent at the moment).
    3. The price property is divided to 100 to have cents and time property is assumed as seconds.
- When user clicks on to a single marker, information related to that marker is shown with an animated Card coming from bottom.
If user clicks on another marker, Card updates itself with the new information. If user clicks on the same marker again then it 
disappears by leaving the screen from the bottom.
- Multiple unit tests for the HTTP call is added. 

### State Management
- Since the specs of the application is straightforward, I wanted to use the Provider to take care of the selected marker
operation and use it to send the information to the listening widgets. I used ChangeNotifierProvider and Consumer from Provider at the places that we need the data. With the HTTP
call I decided to use FutureBuilder because for the sake of simplicity and keeping things aligned, it does a great job with our scenario. 

## What can be done in the future?

- Widget and instrumented tests can be implemented with mocks.
- Better connectivity status handling and orientation handling can be implemented.
- With better specs and graphics the visual parts can be improved.
- Changing specs and improving app will help us to experiment more complex solutions.
