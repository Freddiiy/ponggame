int border = 5;
int rPlayerX, rPlayerY, playerW, playerH, playerSpeed;
int lPlayerX, lPlayerY;
boolean lMoveUp, lMoveDown, rMoveUp, rMoveDown;

int ballX, ballY, ballH, ballW, ballResetX, ballResetY; 
int ballSpeedX, ballSpeedY;

boolean goalOnLeft, goalOnRight;
int scoreLeft = 0, scoreRight = 0, scoreMax = 5;

int count = 1;
void setup() {
  size (1280, 720);
  background(0);
  surface.setTitle("Pong");

  ballSpeedX = 2;
  ballSpeedY = 2;

  //creates ball form
  ballX = width/2;
  ballY = height/2;
  ballH = 20;
  ballW = 20;
  ballResetX = width/2;
  ballResetY = height/2;

  //sets player
  lPlayerX = width-width+40;
  lPlayerY = height/2;
  rPlayerX = width-40;
  rPlayerY = height/2;
  playerW = 20;
  playerH = 80;
  playerSpeed = 5;
}

void draw() {
  frameRate(60);
  background(0);
  showScore();
  gameField();
  playerCol();
  drawPlayer();
  movePlayer();
  //playerController();
  drawBall();
  moveBall();
  ballCol();
  scoreGoal();
  saveScore();
  resetGame();
}

void gameField() {
  noStroke();
  fill(255);
  rectMode(CORNERS);
  rect(width-width, height-height, width, height-height+20);
  rect(width-width, height, width, height-20);
  rect(width/2-10, height-height, width/2+10, height);
}

//Player collision
void playerCol() {
  /*collison detection*/
  //right player
  if (rPlayerY-40 < height-height+20) {
    rPlayerY=height-height+60;
  }
  if (rPlayerY+40 > height-20) {
    rPlayerY=height-60;
  }
  //left player
  if (lPlayerY-40 < height-height+20) {
    lPlayerY=height-height+60;
  }
  if (lPlayerY+40 > height-20) {
    lPlayerY=height-60;
  }
}

void drawPlayer() {
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
}

void movePlayer () {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      lPlayerY = lPlayerY - playerSpeed;
    }
    if (key == 's' || key == 'S') {
      lPlayerY = lPlayerY + playerSpeed;
    }
    if (keyCode == UP) {
      rPlayerY = rPlayerY - playerSpeed;
    }
    if (keyCode == DOWN) {
      rPlayerY = rPlayerY + playerSpeed;
    }
  }
}

void drawBall() {
  //Ball
  noStroke();
  fill(255);
  rectMode(CENTER);
  rect(ballX, ballY, ballH, ballW);
}

void moveBall() {
  //Move ball
  ballX = ballX + ballSpeedX*2;
  ballY = ballY + ballSpeedY*2;
}

void ballCol() {
  //Detects floor
  if (ballY - ballW/2 > height-50) {
    ballSpeedY = -ballSpeedY;
  }
  //Detects roof
  if (ballY - ballW/2 < height-height+25) {
    ballSpeedY = -ballSpeedY;
  }

  //Ball on player collision
  if (ballX + ballW/2 > rPlayerX-playerW/2) {
    if (ballY - ballH/2 < rPlayerY-playerH/2+playerH & 
      ballY-ballH/2 > rPlayerY+playerH/2-playerH) {
      ballSpeedX = -ballSpeedX;
    }
  }

  int lPlayerRightEdge = lPlayerX+playerW/2;

  if (ballX - ballW/2 < lPlayerRightEdge) {
    if (ballY - ballH/2 < lPlayerY-playerH/2+playerH & 
      ballY - ballH/2 > lPlayerY+playerH/2-playerH) {
      ballSpeedX = -ballSpeedX;
    }
  }
}

//goals detection
void scoreGoal() {
  int rightGoalHitbox = width - 35;
  int leftGoalHitbox = width - width + 35;
  int ballRightHitbox = ballX + ballW/2;
  int ballLeftHitbox = ballX - ballW/2;

  if (ballRightHitbox > rightGoalHitbox) {
    goalOnRight = true;
  }
  if (ballRightHitbox < rightGoalHitbox) {
    goalOnRight = false;
  }
  if (ballLeftHitbox < leftGoalHitbox) {
    goalOnLeft = true;
  }
  if (ballLeftHitbox > leftGoalHitbox) {
    goalOnLeft = false;
  }
}

//saves current score
void saveScore() {
  if (goalOnRight == true) {
    scoreLeft++;
  }
  if (goalOnLeft == true) {
    scoreRight++;
  }
}

void resetGame() {
  if (goalOnRight == true) {
    setup();
    println(scoreLeft + " - " + scoreRight);
    println("reset game");
  }
  if (goalOnLeft == true) {
    setup();
    println(scoreLeft + " - " + scoreRight);
    println("reset game");
  }
}

void showScore() {
  fill(255);
  textAlign(CENTER);
  textSize(128);
  text(scoreLeft, width/2 - 100, height-height+200);
  text(scoreRight, width/2 + 100, height-height+200);
}
