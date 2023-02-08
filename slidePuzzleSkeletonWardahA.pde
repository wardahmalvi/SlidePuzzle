///////////////////////////////////////////////////
//    Sliding tile puzzle game.  Smith.  2020    //
//  Yes, of course I have the solution to this.  //
///////////////////////////////////////////////////

//Wardah Alvi - slidePuzzleSkeleton Project
// CRCP 3305-801C


//  See instructions tab

// Global declarations:
// Below is a 2d array that reflects the current state of the puzzle board. It is mixed later.
int[][] current = {{16, 16, 16, 16}, {16, 16, 16, 16}, {16, 16, 16, 16}, {16, 16, 16, 16}};
// Below is a 2d array that reflects the state of a solved puzle board.
int[][] solved = {{1, 2, 3, 4}, {5, 6, 7, 8}, {9, 10, 11, 12}, {13, 14, 15, 0}};
int numberOfMoves = 0; // Counts the number of moves it takes to get to a solution
String bannerMessage = "";  // Message at the bottom of the screen
String movesMessage = "";  // Another message at the bottom of the screen
int blockSize = 150;  // size of tiles on puzzle board. I changed the size of the game
int blankX = 0;  // X index of blank tile (0), used for determining valid moves 
int blankY = 0;  // Y index of blank tile (0), used for determining valid moves
color numColor = color(random(255),random(255),random(255)); // I wanted the color to be different everytime the game restarted



//  The function below is complete - no need to change any of it, unless you are beautifying output.
void setup() {
  size(600, 675);  //  Set display window. I changed the size to adapt to the bigger game console
  initGame(); // reset game paremeters for a new game
  fill(0);  // set fill color to black
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void draw() {
  background(numColor);  // clear background
  displayPuzzle();  // display the puzzle board
  if (isSolved()) {  // function call in conditional checks to see if puzzle is solved 
    bannerMessage = "Congratulations! Press N for new game.";
    displayBanners();
  }
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void initGame() {  // Resets parameters for a new game
  for (int i = 0; i < 4; i ++) {  //  Nested loops prep current board for new mixup
    for (int j = 0; j < 4; j ++) {
      current[i][j] = 16;
    }
  }
  numberOfMoves = 0;  // reset move counter
  bannerMessage = "Press H-Help  A-About  N-New Puzzle";  // reset banner
  mixPuzzle();  // function call to mix up puzzle board
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void mixPuzzle() { // sets the current state to a randomly mixed puzzle
  int num = int(random(16));  // picks a new random integer between 0 and 15
  boolean used = true;  // sets flag
  for (int i = 0; i < 4; i ++) {  // nested loops step through entire puzzle to set new values
    for (int j = 0; j < 4; j ++) {
      while (used) { // keeps generating a random number until it finds one that is unused (no repeats)
        num = int(random(16));
        used = false;
        for (int k = 0; k < 4; k++) {  // checks puzzle to see if current random number has been used
          for (int l = 0; l < 4; l++) {
            if (num == current[k][l]) {
              used = true;
            }
          }
        }
      }
      current[j][i] = num;  // Finally assigns unused number to next cell in array
      if (num == 0) {  // Keeps track of the location of the blank tile (value 0)
        blankX = i;
        blankY = j;
      }
      used = true;
    }
  }
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void displayPuzzle() { // displays puzzle on board
  noFill();
  color boxColor = color(255-red(numColor),255-green(numColor),255-blue(numColor)); // I called this color inside of this function since it won't be recognized outside of it
  textSize(32);                                                                    // the purpose of this color is to give a complementary opposite color of numColor based on the color wheel. I used an example from online to see how to do this
  for (int i = 0; i < 4; i++) { // Steps through array, determining position, color, and values based on array
    for (int j = 0; j < 4; j++) {
      if (current[j][i] == 0) { // since you used the Y value first I adjusted my changes to this (I did not know if we were supposed to make changes to your main code)
        fill(0); // I decided the keep the main square black to make a distinctions
        rect(i * blockSize, j * blockSize, blockSize, blockSize); 
      } else {
        fill(boxColor); // this is the corresponding box color and changes the puzzle's squares to a random corresponding color
        rect(i * blockSize, j * blockSize, blockSize, blockSize);
        fill(numColor); // this is calling a random color so it needs to be outside the draw function or the color switches every time the code re-loops
        text(current[j][i], i*blockSize + (blockSize/2), j*blockSize + (blockSize/2)); // again I kept my Y and X according ot the way you made the code.
      }
    }
  }
  displayBanners();  // function call displays appropriate message at bottom of screen
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
int whichY() { // return the x index for the position that was clicked, 4 if invalid
  int index = 4;
  if (mouseX <= (blockSize * 4) && mouseY <= (blockSize * 4)) {  // checks to see mouse on the board
    index = mouseY/blockSize;
  }
  return index;
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
int whichX() {
  int index = 4;
  if (mouseX <= (blockSize * 4) && mouseY <= (blockSize * 4)) {  // checks to see mouse on the board
    index = mouseX/blockSize;
  }
  return index;
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void displayBanners() { // displays the current banner messages
  fill(0);
  textAlign(CENTER);
  textSize(14);
  text(bannerMessage, width/2, height * .93);
  text("Moves: " + numberOfMoves, width/2, height * .97);
}

//  The function below is complete - no need to change any of it, unless you are beautifying output.
void keyPressed() { // runs once every time key is pressed
  if (bannerMessage != "Press H-Help  A-About  N-New Puzzle") {  // goes back to default message
    bannerMessage = "Press H-Help  A-About  N-New Puzzle";
  }
  if (key == 'A' || key == 'a') { // Display "about" message
    bannerMessage = "Slide Puzzle, 2020, CRCP-3305";
  }
  if (key == 'H' || key == 'h') { // Display "Help" message
    bannerMessage = "Click tiles adjacent to blank space until solved";
  }
  if (key == 'N' || key == 'n') { // Reset the game
    initGame();  // Function resets all parameters
  }
}
/////////////////////////////////////////////////////////////////////////////////////
//  You will need to modify every function below this box to get the game running  //
/////////////////////////////////////////////////////////////////////////////////////

////////////// - You will need to modify this function based on the comments inside it

boolean moveIsValid () { // checks to see if the mouse clicked on a square that is valid move
  boolean valid = false;
  int moveY = whichY();
  int moveX = whichX();
  println("You clicked on index " + moveY, moveX); // I left the console output since it helped me see whether the function was working right or not
  println("The blank tile is at " + blankY, blankX); 
  if (moveX == blankX -1 && moveY == blankY) {  //  If they are adjacent (above, below, left, or right) then set valid to true. 
    valid = true; 
  } else if (moveX == blankX +1 && moveY == blankY) { // like math we are adding or subtracting the array to move positions however this code is just calculating whether the moveIsValid
     valid = true;
  } else if (moveY == blankY -1 && moveX == blankX) {
    valid = true;
  } else if (moveY == blankY +1 && moveX == blankX) {
    valid = true;
  } 
  return valid; // Return valid only if it is a valid move, of course
  
  //  Add code here that checks to see if the blank tile is adjacent to the tile that was clicked.
  //  Use the variables moveY, moveX, blankY, blankX (and some math) to do this.
  //  Note all of the "Special cases" - corners, left edge, right edge, top edge, bottom edge, middle
  //  Right now, this function thinks every move is invalid, and needs to be modified.
  //  Feel free to modify or eliminate the console output as well.
  
}


////////////// - You will need to modify this function based on the comments inside it
void registerMove () { // changes the current array - only called if move is valid
  int moveY = whichY();
  int moveX = whichX();
  println(moveY + " " + moveX); // This tells us which move was registered in the console for accuracy
  int val = current[moveY][moveX]; // this is here to moveX and moveY and assign them a variable so the blank square can shift to the new one
  current[moveY][moveX] = 0; // however once moved, the move values need to be blank again needs to be able to be blank again
  current[blankY][blankX] = val; 
  blankX = moveX;
  blankY = moveY;
  
  // Add code here to re-arrange the "current" board with the new move (hint: calling whichY() and 
  // whichX() will give you the index values for the validated move (just like in moveIsValid()). 
  // You will need to figure out the math and re-assign values within the array the reflect the move.
  // You may need to pass values into this function, depending on how you implement it.
  //  As you can see there is no implementation in this function right now so you will have to write it.
}

////////////// - You will need to modify this function based on the comments inside it
boolean isSolved() {
   for (int i = 0; i < 4; i++) { // Add code here that will check the current puzzle array against the solved puzzle array.
    for (int j = 0; j < 4; j++) {
      if(current[i][j] != solved[i][j]){  // If they match it will return true, else it will return false.
        return false;
      }
    }
     }

  return true; // Return true only is the current array matches the solved array
  // compares current board to solved board - returns true if solved
  //  There is currently no logic to check if they match, so you will need to write it.
}

////////////// - You will need to modify this function based on the comments inside it
void mouseClicked() { // runs once every time mouse is clicked
  String message = "";
  if (moveIsValid()) {
    message = "is";
    numberOfMoves++;
    registerMove();  // Add code here to call the registerMove() function but only if the move is valid.
  } else {
    message = "is not";
  }
  println("This " + message + " a valid move.");  
  println();

  // You can remove or modify the output of this function as needed. 
}
