int border = 5;
int rPlayerX, rPlayerY, rPlayerW, rPlayerH;
int lPlayerX, lPlayerY, lPlayerW, lPlayerH;
int ballX, ballY, ballH, ballW; 
int ballSpeedX, ballSpeedY;
void setup() {
  size (1280, 720);
  ballSpeedX = 5;
  ballSpeedY = 5;
  
  //creates right player form
  //rPlayerX
  //creates ball form
  ballX = width/2;
  ballY = height/2;
  ballH = 20;
  ballW = 20;
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
  
  //Player
  noCursor();
  noStroke();
  rectMode(CENTER);
  rect(width-40, mouseY, 20, 80);
  if(mouseY-60 < height-height+20) {
      mouseY=height-height+60;
   }
  if(mouseY+60 > height-20) {
     mouseY=height-60;
   }
   
   //Ball
   noStroke();
   fill(255);
   rectMode(CENTER);
   rect(ballX, ballY, ballH, ballW);
   
   //Move ball
   ballX = ballX + ballSpeedX*2;
   ballY= ballY + ballSpeedY*2;
   
   //Detects floor
   if (ballY - ballW/2 > height-50) {
     ballSpeedY = -ballSpeedY;
   }
   //Detects roof
   if (ballY - ballW/2 < height-height+25) {
     ballSpeedY = -ballSpeedY;
   }
   
   //Detects right player
   //if ()
   
   //Detects floor
   /*
   //ball detects wall
   if (ballX - ballW/2 > width-40){
     ballSpeedX = -ballSpeedX*1;
     ballSpeedY = -ballSpeedY*1;
   }
   else {
     ballSpeedX = 5;
     ballSpeedY = 5;
   }
   */
   
   //bounce
}
