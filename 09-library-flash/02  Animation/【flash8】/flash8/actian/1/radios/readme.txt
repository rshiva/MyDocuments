Here's how this widget works...

Place the 'radioMovie' movie clip onto the timeline.  In the first frame of the main timeline, you will need to do a tell target to set the variables.

The first var to set is the 'numRadioBtns' variable.  This is the number of radio buttons you want to have.  The "second" var to set is the text for each radio button.  You do this by setting a variable called "textfield", followed by the number of the radio button you want to set, equal to the text you want to see.  So if you had three radio buttons, and you wanted the text to be "Peirce", "Dewey", and "James", the source would read:

Begin Tell Target ("instanceNameOfMovieHere")
      Set Variable: "numRadioBtns" = 3
      Set Variable: "textField1" = "Peirce"
      Set Variable: "textField2" = "Dewey"
      Set Variable: "textField3" = "James"
End Tell Target

From there, detecting the checked one is simple.  The radio button that is checked will have a variable whose value is equal to 1.  So if you were to select "dewey", the value is set by the radio button that is checked (weird phrasing, I know).  By looking at the output, you woudl see this..

Movie Clip:  Target=""
Variable _level0/instanceNameOfMovieHere/radio1:value = "0"
Movie Clip:  Target=""
Variable _level0/instanceNameOfMovieHere/radio2:value = "1"
Movie Clip:  Target=""
Variable _level0/instanceNameOfMovieHere/radio3:value = "0"

Since Dewey was the second radio button, it is "radio2".  Hope that makes sense, and good luck!
