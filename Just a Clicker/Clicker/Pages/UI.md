# Main menu

1. Create a Ui node
   1. inherit VBoxContainer
	  1. Inherit required number of buttons
   2. Change the position of by using the layout option in the tool bar
2. Now add a script to the root node
3. Add pressed() signal to Start button


# Algorithm'
1. Select the pressed() signal and connect to the script (Do this for each button)
2. Now inside the signal func use get_tree() and change scene for start and options menus
3. For the quit option use get_tree() and quit()




# Pause Menu

1. Create a new node do the same steps from main menu
2. Add a new input for pause (Esc)
3. In the main script add a new input action pressed if statement
4. Get the pause scene and inherit to the main node
5. 


# Algorithm

   1.  In the main script add a new input action pressed if statement
      * call the pause menu function
   2. get the pause menu scene into the script
   3. create a Boolean variable named paused and assign it to false
   4. create a func for the pause menu
	      1. create a if branch if paused is true then hide the pause menu and set the engine timescale to 1
	      2. or else show the pause menu and set the engine timescale to 0
	      3. finally out of all set the value of the paused variable to it's complement

 In the pause menu main script connect the signals of the buttons to script 
 1. On resume button refer main node 
 2. On options button refer the option menu 
 3. On quit button quit the tree



