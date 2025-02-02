CurrencyAdventure
============================
This homework assignment brings together all the concepts we have been introducing and gives you practice working with
them including:
- Layout managers
- Text, images, and audio
- Navigation and routing
- Forms and user input
- Custom widgets
- State management

Objective
---------
Create a Flutter app that converts a real-world currency (US dollars) into fictional currencies from popular books, movies, or games
and allows users to purchase fictional items from that world.

Requirements
------------
### User Interface
* Home Page
    - Display the user's current balance in US dollars
    - Display the user's current inventory (items purchased)
    - A button to allow the user to deposit more money
      * When the button is pressed a popup dialog should prompt for an amount
        * The dialog should only accept positive numbers
        * A confirmation (Ok) and a cancel button
        * If confirmed the amount should add to the user's balance
      * A bottom navigation bar with buttons that takes the user to one of the fictional currency screens
* Fictional Currency Screen
  * Display an image representing the fictional currency (doesn't necessarily have to be authentic)
  * Display the user's current balance in the fictional currency, i.e. current balance * exchange rate (you can make up the exchange rate)
  * At least 3 buttons representing items for purchase
    * Buttons can have text labels but images are preferred
    * If the user presses the button:
      * If there is enough fictional currency the balance is debited in the equivalent dollars, the item is added to the inventory and a confirmation sound is played
      * If there is not enough fictional currency a negative sound is played and nothing else happens
* Title bar
  * A home button that when pressed will take the user to the main screen
    
### Functionality
  - Implement at least 3 fictional currencies (e.g., Galleons from Harry Potter, Credits from Star Wars, etc.)
  - Each fictional currency should have at least 3 items to purchase

### UI
  - Grading will include points for the styling of the app
  - Layouts should be responsive and well-presented (centered, appropriately spaced, etc.)
