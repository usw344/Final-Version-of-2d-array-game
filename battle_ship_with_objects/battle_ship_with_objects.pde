// Muhammad Ahmed
// November 14 2017
// Compsci 30 fall 2017
// 2d array
// extra for exp = objects : ) dont know how i lived without them.

PImage win,lost;


int[][] theBoard, theEnemyBoard, theFinalBoard, theFinalEnemyBoard;

int rows, cols, state, lengthOfBoard, squareHeight, squareWidth, xChoice, yChoice, xAiChoice, yAiChoice;

boolean letTheGameBegin, playerTurn, playerWin, aiWin;

Ship ship1, ship2, ship3;

EnemyShip e1, e2, e3;

Button startButton, readyButton;

void setup() {
  size(800, 800);
  aiWin = true;
  playerWin = true;
  state = 0; // default being the start screen
  
  lengthOfBoard = 20;
  
  rows = lengthOfBoard;
  cols = lengthOfBoard;
 
  playerTurn = true;
  
  newObjects();// starting all my objects
  
  startBoardValues(); // these are setting up the board and values that go with it.
  
  assagineValues();
  
  win =loadImage("yodaer.jpg");
  lost = loadImage("lostYoda.jpg");
  

  
  


  
}

void draw() {
  background(255);

  if (state == 0) { // This is the start Menu code. 
    startButton.displayButton(width/2, height/2, 200, 75);
    startButton. isTheButtonBeingClicked(1);
    startButton.theText("start");
  }

  if (state == 1) { // ) where the ships are setup;
    displayBoard();

    readyButtonHandler(); // putting all my object code into functions. 
    theBoard = new int [cols*2][rows*2]; // refreshes the board every frame during prep per. 
    shipHandler();

    displayFinalShips(); // showing real time where all the ships are
  }

  if (state == 2) { // the main game code. including AI
    drawChangingBoard();  
    displayEnemyBoard();
    
    if(e1.amIGone() && e2.amIGone() && e3.amIGone()) {
      state = 3;
    }
    if(ship1.isHopeLost() && ship2.isHopeLost() && ship3.isHopeLost()) {
      state = 4;
    }
  }
  if(state == 3) {
    displayEnemyBoard();
    playerWonItScreen();
  
  }
  if(state == 4) {
    drawChangingBoard();
    theAiHasWonIt();
  }

}


////// starting all the values functions

void assagineValues() {
  ship1.assigneValues(width - width/4, height/2);
  ship2.assigneValues(width - width/4 + width/20, height/4);
  ship3.assigneValues(width - width/4 -  width/20, height /3);

  e1.assigment(int(random(2,10)),int(random(2,7)));
  e1.displayEnemyShip();
  
  e2.assigment(int(random(2,10)),int(random(2,7)));
  e2.displayEnemyShip();
  
  e3.assigment(int(random(2,10)),int(random(2,7)));
  e3.displayEnemyShip();
}


void newObjects() {
  ship1 = new Ship();
  ship2 = new Ship();
  ship3 = new Ship();

  startButton = new Button();
  readyButton = new Button();
  
  e1 =  new EnemyShip();
  e2 =  new EnemyShip();
  e3 =  new EnemyShip();
}
void readyButtonHandler() {
  readyButton.displayButton(0 + width/5, 0 + height/4, 200, 100);
  readyButton.isTheButtonBeingClicked(2);
  readyButton.theText("Battle!!");
}


void shipHandler() {
  ship1.displayShip();
  ship2.displayShip();
  ship3.displayShip();



  ship1.checkToSeeIfClicked();
  ship1.move();
  ship1.snap();

  ship2.checkToSeeIfClicked();
  ship2.move();
  ship2.snap();

  ship3.checkToSeeIfClicked();
  ship3.move();
  ship3.snap();
}


void startBoardValues() {
  theBoard = new int [cols*2][rows*2];
  theEnemyBoard = new int [cols*2] [rows*2];
  theFinalBoard = new int [cols*2][rows*2];
  squareWidth = width/lengthOfBoard;
  squareHeight =height/lengthOfBoard;
}


///////// all Code that concerns board drawing

void displayBoard() {
  for (int x = 1; x < cols+1-10; x++) {
    for (int y = rows/2; y < rows; y++) {
      
      if (y == lengthOfBoard/2) {
        fill(0);
      } else {
        fill(255);
      }
      rect(x*squareWidth, y*squareHeight, squareWidth, squareHeight);
    }
  }
}
void displayFinalShips() {
  for (int x = 1; x < cols; x++) {
    for (int y = 1; y < rows; y++) {
      if (theBoard[x][y] == 1) {
        fill(0);
        rect(x*squareWidth, y*squareHeight, squareWidth, squareHeight);
      }
    }
  }
}


///// playerHandler 

void drawChangingBoard() {
  for (int x = 1; x < cols+1-10; x++) {
    for (int y = rows/2; y < rows; y++) {
      if (y == lengthOfBoard/2) {
        fill(0);
      } else {
        fill(255);
      }
      if (theFinalBoard[x][y] == 1) {
        fill(0);
      }
      if (theFinalBoard[x][y] == 2) { // defines the ship being hit
        fill(255, 0, 0);
      }
      if (theFinalBoard[x][y] == 3) { // hitting an empty square
        fill(0, 0, 255);
      }

      rect(x*squareWidth, y*squareHeight, squareWidth, squareHeight);
    }
  }
}


void playerShots() {
  xChoice = int(mouseX/squareHeight);
  yChoice = int(mouseY /squareHeight) + 1;

  if (playerTurn && mousePressed) {

    if (xChoice < 11 && yChoice < rows/2) {
      if (theEnemyBoard[xChoice][yChoice] == 0) {
        theEnemyBoard[xChoice][yChoice] = 2; // if you are hitting the enemy ship
      
    } else if (theEnemyBoard[xChoice][yChoice] == 1) {
        theEnemyBoard[xChoice][yChoice] = 3;
      
    } else if (theEnemyBoard[xChoice][yChoice] == 2) {
        playerTurn = true;
      }
      playerTurn = false;
    }

    xChoice = int(mouseX - squareHeight/2);
    xChoice = int(mouseY - squareHeight/2);
    
    xChoice = int(xChoice/squareHeight) + 2;
    yChoice = int(yChoice /squareHeight);
  
  if (xChoice < 11 && yChoice < rows/2) {
        for (int x = 1; x < cols+1-10; x++) {
          for (int y = rows/2; y < rows; y++) {
            if(theEnemyBoard[xChoice][yChoice] == 0) {
              theEnemyBoard[xChoice][yChoice] = 2; // if you are hitting the enemy ship
            }
            else if(theEnemyBoard[xChoice][yChoice] == 1) {
              theEnemyBoard[xChoice][yChoice] = 2;
            }
            else if(theEnemyBoard[xChoice][yChoice] == 2) {
              playerTurn = true;
            }
            playerTurn = false;
      }
        }
      } 
  }
}


/// ai stuff 
void theAI() {
  if (playerTurn == false) {
    xAiChoice = int(random(1, 11));
    yAiChoice = int(random(11, 20));
    for (int x = 1; x < cols+1-10; x++) {
      for (int y = rows/2; y < rows; y++) {
        if (theFinalBoard[xAiChoice][yAiChoice] == 1) {
          theFinalBoard[xAiChoice][yAiChoice] = 2; // this is for hitting
        
      } else if (theFinalBoard[xAiChoice][yAiChoice] == 0) {
          theFinalBoard[xAiChoice][yAiChoice] = 3; // this is if it hits an empty scare
        
      } else if (theFinalBoard[xAiChoice][yAiChoice] == 2 || theFinalBoard[xAiChoice][yAiChoice] == 3) {
          playerTurn = false;
        
      }
        playerTurn = true;
      }
    }
  }
}

void displayEnemyBoard() {
  for (int x = 1; x < cols+1-10; x++) {
    for (int y = 1; y < rows/2; y++) {
      if (y == lengthOfBoard/2) {
        fill(0);
      } else {
        fill(255);  // this is the base color of blue for the enemy squares
      }
      if ( theEnemyBoard[x][y] == 1) {
        //fill(0);
      
      }
      if (theEnemyBoard[x][y] == 2) {
        fill(100, 100, 243);
      }
      if (theEnemyBoard[x][y] == 3) {
        fill(102,200,89);  
      
      }
      rect(x*squareWidth, y*squareHeight, squareWidth, squareHeight);
    }
  }
}

void theAiHasWonIt() {
  fill(0);
  textSize(32);
  text("the freedom alliance", 5, height/8);
  text("has failed, doomed we are", 5, height/5); 
  
  image(lost,width/2 + 50, height/4,250,250);

}
    


void playerWonItScreen(){
  fill(0);
  textSize(32);
  text("Windows lost the game", 5, height/2 + 50);
  text("saved the world you have humm", 5, height/2 + 100); 
  
  image(win,5,height/2+125, 250,250);


}

void mousePressed() {
  if (state == 2) {
    if (playerTurn) {
      playerShots();
    } else if (playerTurn == false) {
      theAI();
    }
  }
}


void keyPressed() {
  if (key == 'q') {
    playerTurn = false;
  }

}