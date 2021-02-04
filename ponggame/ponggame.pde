int border = 5;
int rPlayerX, rPlayerY, playerW, playerH, playerSpeed;
int lPlayerX, lPlayerY;
int ballX, ballY, ballH, ballW; 
int ballSpeedX, ballSpeedY;
boolean lMoveUp, lMoveDown, rMoveUp, rMoveDown;
void setup() {
  size (1280, 720);
  ballSpeedX = 2;
  ballSpeedY = 2;
  
  //creates right player form
  //rPlayerX
  //creates ball form
  ballX = width/2;
  ballY = height/2;
  ballH = 20;
  ballW = 20;
  
  //sets player
  lPlayerX = width-width+40;
  lPlayerY = height/2;
  playerSpeed = 5;
}

void draw() {
  frameRate(60);
  background(0);
  
  // Game field
  noStroke();
  fill(125);
  rectMode(CORNERS);
  rect(width-width, height-height, width, height-height+20);
  rect(width-width, height, width, height-20);
  rect(width/2-10, height-height, width/2+10, height);
  
  
  //Players
  rPlayerX = width-40;
  rPlayerY = mouseY;
  playerW = 20;
  playerH = 80;
  
  /*collison detection*/
  //right player
  if(rPlayerY-60 < height-height+20) {
      rPlayerY=height-height+60;
   }
  if(rPlayerY+60 > height-20) {
     rPlayerY=height-60;
   }
   //left player
   if(lPlayerY-60 < height-height+20) {
      lPlayerY=height-height+60;
   }
  if(lPlayerY+60 > height-20) {
     lPlayerY=height-60;
   }
   
  //right player
  noCursor();
  noStroke();
  rectMode(CENTER);
  rect(rPlayerX, rPlayerY, playerW, playerH);
  //left player
  noCursor();
  noStroke();
  rectMode(CENTER);
  rect(lPlayerX, lPlayerY, playerW, playerH);
  
  //player controller
  if (lMoveUp) {
    lPlayerY = lPlayerY - playerSpeed;
  }
  if (lMoveDown) {
    lPlayerY = lPlayerY + playerSpeed;
  }
  if (rMoveUp) {
    rPlayerY = rPlayerY - playerSpeed;
  }
  if (rMoveDown) {
    rPlayerY = rPlayerY + playerSpeed;
  }
  
  //Key pressed check
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      lMoveUp = true;
    }
    else {
      lMoveUp = false;
    }
    if (key == 's' || key == 'S') {
      lMoveDown = true;
    }
    else {
      lMoveDown = false;
    }
    //right player
    if (key == 'o' || key == 'O') {
      rMoveUp = true;
    }
    else {
      rMoveUp = false;
    }
    if (key == 'l' || key == 'L') {
      rMoveDown = true;
    }
    else {
      rMoveDown = false;
    }
  }
   //Ball
   noStroke();
   fill(255);
   rectMode(CENTER);
   rect(ballX, ballY, ballH, ballW);
   
   //Move ball
   ballX = ballX + ballSpeedX*2;
   ballY = ballY + ballSpeedY*2;
   
   //Detects floor
   if (ballY - ballW/2 > height-50) {
     ballSpeedY = -ballSpeedY;
   }
   //Detects roof
   if (ballY - ballW/2 < height-height+25) {
     ballSpeedY = -ballSpeedY;
   }
   
   /*Detects right player*/
   //hit top bounce ball opposite
   if (ballX - ballW/2 > rPlayerX-playerW){
     if (ballY - ballH/2 > rPlayerY-playerH) {
        ballSpeedX = -ballSpeedX;
     }
   }
}
