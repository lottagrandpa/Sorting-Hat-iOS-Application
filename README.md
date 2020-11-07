Harry Potter - The sorting App
===============================
The version of my xcode is built on V11.3 iphone8.

Database
-----------
The foundation of the database was grabbed from https://hp-api.herokuapp.com. using Python. The data was extended using information from https://harrypotter.fandom.com. The database was converted to xml and an xml parser implemented in swift. The xml parser does not only read the data into a single list, but sorts the data into four lists based on the house-attribute in the data. Images were completely replaced, as the original ones were not suitable for the layout of the app.


Multiple Houses
------------------
The app presents the persons separated into the four houses of Hogwarts. Gryffindor, Hufflepuff, Ravenclaw and Slytherin. The app therefore does not only present a single list of persons with details, but four lists instead. Another view had to be prepended to give the user the option to select the house.


Carousel Selector in Obj-Carousel
----------------------------------
THe first view presents the shields of the four houses of Hogwarts. Selection of the house for the following views is done creatively with a carousel. The carousel is a foreign library https://github.com/nicklockwood/icarousel. The library is implemented in obj-C and had to be integrated in the swift environment. The Carousel was customized to match the style Harry Potter. obj-C selector functions were attached s.t. a segue can be triggered from the carousel images.

Custom Tablecell
----------------
The next view presents all the members of that house in a TableViewController with custom TableCells. Responsive constraints for position and height were used throughout the tablecell in order to make the app portable to smartphones with different screen sizes. The look and feel of the TableViewController was partly inspired by the way Instagram presents its data.

Custom UIView
-------------
Upon clicking on a tablecell the user is directed to the third view. Here some more detailed information for a single person is presented. The layout is done with a custom UIView and includes changes to the corner-radius, background-color and font. 

Tabbar Control with unwind segue
--------------------------------
Navigation control is now delegated to a tabbar in the bottom part of the screen. Apart from the button to go the next view another button is added to unwind back to the start. This unwinding required switching over the targets during the prepare-segue phase, because othwerwise wrong data would be passed to the first scene.


Popup window with visual effect
-------------------------------
An additional button is the top-right corner, upon pressing the image appears as a popup on top of the whole screen. To make the transition more visually appealing a blur filter is added and the transition phase fully animated. The reverse animation is used upon clicking the cancel button in the center of the screen.


Video Background
----------------
The fourth screen presents all the detailed data as key-value pairs in text. In the background a video was added in an infinite loop. The video was cut and cropped prior to inserting it into xcode. Again obj-c selectors are used to make an infinitively looping video possible. 


Multiple Webpage links
-----------------------
The tabbar at the bottom of the page now presents three buttons. The home button as well as two links to different websites. One link shows the wikipedia for the role in the Harry Potter universe and the other shows the wikipedia for the actor playing that character in the movies.


Author
-------
JIAYING ZHANG
