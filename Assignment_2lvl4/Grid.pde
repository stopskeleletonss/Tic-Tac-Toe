class Grid {
  int size=200; //size of one section of the grid

Grid() {}

  void drawgrid() {
  for (int index1=0; index1<g1.length; index1++) { //index1 variable has an initial value of 0, must be less than the length of g1 array, and increases by increments of 1
    for (int index2=0; index2<g1[0].length; index2++) { //index2 variable has an initial value of 0, must be less than the length of g1[0] array, and increases by increments of 1
      fill(255);
      square(index1*size, index2*size, size); //creates squares in the form of a 3x3 grid
    }
  }
}
}
