int rows=3; //number of rows in the grid
int columns=3; //number of colums in the grid
int pressedX, pressedY; //variables holding the x and y corrdinates of the mouse when clicked
int clicks; //how many squares have been clicked
int[][] g1 = new int[columns][rows]; //creates a 3x3 2d array in order to create the game board
boolean clicked; //boolean for if a square has been clicked
boolean xturn; //boolean for if x goes first (false means that o starts)
boolean gamestart, gameend, xwins, tie; //booleans for whether the game has started, stopped, if x won (false means o won), and if the game ended as a draw
Player p1; //creates one instance of the player class
Grid gr1; //creates one instance of the grid class


void setup() {
  background(255);
  size(600, 600);
  p1=new Player(); //initializes the player class
  gr1=new Grid(); //initializes the grid class
}

void draw() {
  if (gamestart==false) { //if the game hasn't started
    startsequence(); //calls function to display title screen text
  }
  if (gamestart==true&&gameend==false) { //if the game has started and hasn't ended
    gr1.drawgrid(); //calls function to draw the game board
    p1.playsymbols(); //calls function to display and "x" or "o" when a square is clicked, depending on who's turn it is
    wincheck(); //calls function to check whether or not the game has ended
  }
  endsequence(); //calls function to display end screen if the game has ended
}

void startsequence() {
  if (gamestart==false) { //if the game hasn't started
    background(255);
    fill(0);
    textSize(60);
    text("Tic Tac Toe", width/4, height/4);
    textSize(50);
    text("Press X or O to start", width/8+20, height/2);
    textSize(30);
    text("(Corresponding symbol will be first)", width/8, height/2+60);
    if (key=='x' && gamestart==false) { //if the x key is pressed and the game hasnt started
      xturn=true; //x goes first
      gamestart=true; //the game has started
    }
    if (key=='o' && gamestart==false) { //if the o key is pressed and the game hasnt started
      gamestart=true; //the game has started
    }
  }
}

void endsequence() {
  if (gameend) { //if the game has ended
    background(255);
    fill(0);
    textSize(80);
    if (xwins) { //if x won the game
      text("X Wins", width/3-25, height/2);
    } else if (tie) { //else if the game ended in a draw
      text("Draw", width/3, height/2);
    } else {  //if x hasn't won and the game didn't end in a draw (if o won)
      text("O Wins", width/3-25, height/2);
    }
    textSize(40);
    text("Press R to Restart", width/4, height/4*3);
  }
}

void wincheck() {
  if (((g1[0][0]==1)&&(g1[0][1]==1)&&(g1[0][2]==1))||((g1[1][0]==1)&&(g1[1][1]==1)&&(g1[1][2]==1))||((g1[2][0]==1)&&(g1[2][1]==1)&&(g1[2][2]==1))  ||  ((g1[0][0]==1)&&(g1[1][0]==1)&&(g1[2][0]==1))||((g1[0][1]==1)&&(g1[1][1]==1)&&(g1[2][1]==1))||((g1[0][2]==1)&&(g1[1][2]==1)&&(g1[2][2]==1))  ||  ((g1[0][0]==1)&&(g1[1][1]==1)&&(g1[2][2]==1))||((g1[0][2]==1)&&(g1[1][1]==1)&&(g1[2][0]==1))) { //if there are 3 "x"s in a row in any direction
    xwins=true; //x has won the game
    gameend=true; //the game has ended
  }
  if (((g1[0][0]==2)&&(g1[0][1]==2)&&(g1[0][2]==2))||((g1[1][0]==2)&&(g1[1][1]==2)&&(g1[1][2]==2))||((g1[2][0]==2)&&(g1[2][1]==2)&&(g1[2][2]==2))  ||  ((g1[0][0]==2)&&(g1[1][0]==2)&&(g1[2][0]==2))||((g1[0][1]==2)&&(g1[1][1]==2)&&(g1[2][1]==2))||((g1[0][2]==2)&&(g1[1][2]==2)&&(g1[2][2]==2))  ||  ((g1[0][0]==2)&&(g1[1][1]==2)&&(g1[2][2]==2))||((g1[0][2]==2)&&(g1[1][1]==2)&&(g1[2][0]==2))) { //if there are 3 "o"s in a row in any direction
    gameend=true; //the game has ended (xwins is still false, meaning that o has won the game)
  }
  if (clicks>8) { //if all 9 squares have been clicked, but neither x or o have won
    gameend=true; //the game has ended
    tie=true; //the game has ended in a draw
  }
}

void mousePressed() {
  if (gamestart==true && gameend==false) { //if the game has started and hasn't ended
    pressedX=int(mouseX/200); //pressedX is equal to the X coordinate of the mouse
    pressedY=int(mouseY/200); //pressedY is equal to the Y coordinate of the mouse
    if (g1[pressedX][pressedY]==0) { //if the square clicked by the mouse is not yet an x or an o
      if (xturn==true) { //if it is currenly x's turn
        g1[pressedX][pressedY]=1; //square clicked is assigned the value of being an x (1)
      } else if (xturn==false) { //if it is currently o's turn
        g1[pressedX][pressedY]=2; //square clicked is assigned the value of being an o (2)
      }
      clicked=true; //a square has just been clicked
      p1.playerclick(); //calls function that changes who's turn it is
    }
  }
}

void keyPressed() {
  if (key=='r'&&gameend) { //if the r key is pressed and the game has ended
    gamestart=false; //the game has not started
    xwins=false; //resets the variable showing that x won the game
    tie=false; //resets the variable showing that the game was a draw
    clicks=0; //sets the amount of squares clicked to 0
    for (int index1=0; index1<g1.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of g1 array, and increases by increments of 1
      for (int index2=0; index2<g1[0].length; index2++) { //index2 variable has an initial value of 0, must be less than the length of g1[0] array, and increases by increments of 1
        g1[index1][index2]=0; //each square on the board is set to the value 0 (neither x or o)
      }
    }
    gameend=false; //the game has not ended
  }
}
