class EnemyShip {
  int xCord, yCord, placeForSecondXcord, placeForSecondYcord;

  EnemyShip() {
    xCord = 2;
    yCord = 3;
    placeForSecondXcord = 1;
    placeForSecondYcord = 0;
  }

  void assigment(int x, int y) {
    xCord = x;
    yCord = y;
    placeForSecondXcord = x;
    placeForSecondYcord = y + 1;
  }

  void displayEnemyShip() {
    theEnemyBoard[xCord][yCord] = 1;
    theEnemyBoard[placeForSecondXcord][placeForSecondYcord] = 1;
  }
}