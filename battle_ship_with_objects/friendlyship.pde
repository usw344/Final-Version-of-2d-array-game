// to snap make sure, that you divid your shipx by the size of the square. then snap the x cord of the ship that the closest in the array value. 

class Ship {
  // data 
  float x, y, placeForOtherSqaureX, halfSize, placeForOtherSqaureY;
  float sizeOfSide, thevalueOfXDq, thevalueOfYSq;
  boolean shipMoving, isMovingAllowed; 

  Ship() {
    sizeOfSide = width/20;
    //x = random(width/2, width);
    //y = 0 + 100;
    halfSize = sizeOfSide/2;

    shipMoving = false;
    isMovingAllowed = true;
  }

  void assigneValues(int w, int t) {
    x = w;
    y = t;
    placeForOtherSqaureX = x;
    placeForOtherSqaureY = y + sizeOfSide;
  
  }


  void displayShip() {

    fill(255, 0, 255);
    rectMode(CENTER);
    rect(x, y, sizeOfSide, sizeOfSide);
    rect(placeForOtherSqaureX, placeForOtherSqaureY, sizeOfSide, sizeOfSide);
    
  }
  void checkToSeeIfClicked() {
    if ((mouseY > y - halfSize && mouseY < y- halfSize + sizeOfSide*2) && (mouseX > x- halfSize && mouseX < x - halfSize + sizeOfSide )) { 
      if (mousePressed && (mouseButton == LEFT) && isMovingAllowed) {
        shipMoving = true;
      } else {
        shipMoving = false;
      }
    }
  }
  void move() { 
    if (shipMoving) {  
      x = mouseX;
      y = mouseY;
      placeForOtherSqaureX = mouseX;
      placeForOtherSqaureY = mouseY + sizeOfSide;
    }
  }

  void snap() {
    int shipXcord, shipYcord;
    shipXcord = int(x - sizeOfSide/2);
    shipYcord = int(y - sizeOfSide/2);
    
    if (x < width/2   &&   y > height/2 + sizeOfSide  && x > sizeOfSide) { // this is the location of the grid that you place the ships on. 
      // calculating exactly where the ships are on the screen
      shipXcord = int(shipXcord/sizeOfSide) + 2;
      shipYcord = int(shipYcord / sizeOfSide);
      
      
      // setting the ships to the array MAIN SNAP CODE
      theBoard[shipXcord-1][shipYcord+1] = 1;
      theBoard[shipXcord-1][shipYcord+2] = 1;
      
      //this keep tracks of the final board that will be used in the game. 
      theFinalBoard[shipXcord-1][shipYcord+1] = 1;
      theFinalBoard[shipXcord-1][shipYcord+2] = 1;

      // this part of the code ensure that only the final localtion of the ship appears on screen. not the all the squares that were used to drag it there.
      for (int w = 0; w < cols; w ++) { // x
        for (int t = 0; t <rows; t++) { // y
          if (theFinalBoard[w][t] == theBoard[w][t]) {
            theFinalBoard[w][t] = theBoard[w][t];
          } else {
            theFinalBoard[w][t] = theBoard[w][t];
          }
        }
      }
    }
  }
}