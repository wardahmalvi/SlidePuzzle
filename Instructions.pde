/*
Sliding Puzzle Game

If these instructions are difficult to read, try making this window as wide as possible on your screen
or cutting and pasting them into a different document.  The main purpose of this assignment is to give
you practice manipulating 2 dimensional arrays, and solving some code problems using your analytical
capabilities.  A smaller portion of the grade is to give you practice with aesthetics and design.

This game is a sliding puzzle game that is implemented with 2D arrays. There are two 2d arrays used.  
One of them represents the puzzle board in its current state and the other represents the solved puzzle.
The game will currently run until the puzzle is solved.  It knows when the puzzle is solved by comparing the 
current array to the solved array.  If they match, the puzzle is solved.  The player clicks on the tiles to
move them.  Only tiles that are adjacent to the blank tile can be moved.  When an adjacent tile is clicked,
it slides into the space of the blank tile. 

Use your knowledge of 2D arrays from your reading and research to get this game running.  There are
several functions in the game that are not implemented.  Your job is to implement them.
All of them have to do with the technical aspects of manipulating 2d arrays.  The game is otherwise
operational, but aesthetically unimpressive.  It is also your job to improve the games appearance.
There are many comments in the code and you should read them all.  This will not only provide clues to
a solution, but also possible deepen you understanding of other coding concepts.  I am obviously available
to answer any questions you might have about the code.  All of the functions that you will need to modify
to get the game operating are at the bottom of the code and clearly identified in the comments.  The other
functions do not need to be changed to get things running, but they will need to change to improve the
appearance of the game.  And you might want to analyze them to see how they work.

You will absolutely need to modify four functions in the code.  moveIsValid(), registerMove(), isSolved(), 
and mouseClicked().

The function moveIsValid() checks to see if a move is valid.  Given the index values for the blank tile
and a clicked tile, you will write the code to determine if these tiles are adjacent on the 4x4 grid, 
returning a boolean value to indicate that.  See the comments in the code.

The function registerMove() is called only when the move is valid.  This function ensures that the 2d array
reflecting the current state of the puzzle is updated to reflect the valid move.  Again, see comments.

The function isSolved() returns a boolean value.  It compares the 2d array the reflects the current state 
of the puzzle to the 2d array that reflects the solved puzzle.  If they match, the function returns true, 
otherwise it returns false.  The comments will point you in the right direction.

The mouseClicked event handler should be simple to modify by following the instructions in the comments.
The event handler will call the registerMove() function if and only if the clicked position results in a
valid move from the moveIsValid() function call.

Implementing the code needed to get the game running will earn 80 points on the assignment.  The final 20 points 
will be based on your modification of the code to provide aesthetic appeal to the game.  The current greyscale 
appearance is dull and boring.  Consider adding color, changing the scale, adding sound, adding a theme, etc.
This will require you to study, understand, and modify the existing code, even the functions beyond the 
four mentioned above.
*/
