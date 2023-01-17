class Player {
  PImage playerx, playero; //PImage for x and o

  Player() {
    playerx = loadImage("ximage.png"); //playerx is assigned the image of x
    playero = loadImage("oimage.png"); //playery is assigned the image of o
  }

  void playsymbols() {
    for (int index1=0; index1<g1.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of g1 array, and increases by increments of 1
      for (int index2=0; index2<g1[0].length; index2++) { //index2 variable has an initial value of 0, must be less than the length of g1[0] array, and increases by increments of 1
        if (g1[index1][index2]==1) { //if a square has been assigned the value of being an x
            image(playerx, index1*gr1.size, index2*gr1.size); //draw an x in said square
      }
           else if (g1[index1][index2]==2) { //otherwise, if a square has been assigned the value of being an o
            image(playero, index1*gr1.size, index2*gr1.size); //draw an o in said square
          }
        }
      }
    }

  void playerclick() {
    if (clicked==true) //if a square has been clicked
      if (xturn==false) { //if it was o's turn
        xturn=true; //it is now x's turn
      } else { //otherwise, if it was x's turn
        xturn=false; //it is no longer x's turn (it is now o's turn)
      }
      clicks++; //add one to the total number of squares clicked
      clicked=false; //a square is no longer being clicked
    }
  }
