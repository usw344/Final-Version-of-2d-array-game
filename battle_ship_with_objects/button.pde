class Button {
  float buttonX,buttonY,buttonHeight,buttonWidth; 
  boolean isButtonClicked;
  
  Button() {
    isButtonClicked = false;
  }
  void displayButton(int x, int y, int w,int h) {
    rectMode(CENTER);
    buttonX = x;
    buttonY = y;
    buttonHeight = h;
    buttonWidth = w;
    if (isButtonClicked) {
      fill(255,57,57);
    }
    else {
      fill(252,0,0);
    }
    rect(buttonX,buttonY,buttonWidth,buttonHeight);  
}
  void isTheButtonBeingClicked(int objState) {
    float halftheButtonSizeX =  buttonWidth/2;
    float halftheButtonSizeY = buttonHeight/2;
    if (mouseX > buttonX - halftheButtonSizeX && mouseX < buttonX - halftheButtonSizeX+ buttonWidth && mouseY > buttonY - halftheButtonSizeY && mouseY < buttonY - halftheButtonSizeY + buttonHeight) {
      isButtonClicked = true;
      if (mousePressed) {
        doTheAction(objState);
      }
    }
    else {
      isButtonClicked = false;
    }
  
  }

  void doTheAction(int stateVarNum) {
    state = stateVarNum;
    
  }

  void theText(String blank) {
    textSize(buttonWidth/6);
    fill(255);
    text(blank,buttonX - buttonWidth/4,buttonY);
  }





}