Segment snakePart;
Apple apple;
ArrayList<Segment> snake;
color red = color(255, 0, 0);
color green = color(0,150,0);
float snakepartLength = 20;
int score;

void setup(){
 size(600,800);
 score = 0;
 snake = new ArrayList<Segment>();
 apple = new Apple();
 snakePart = new Segment(width/2, height/2, snakepartLength);
 snake.add(snakePart);
 for(int i = 1; i < 4; i++){
   color f = green;
   if(i%2 == 0){f = red;}
   else{f = green;}
   snakePart = new Segment(snake.get(i-1), snakepartLength, f);
   snake.add(snakePart);
 }
}

void draw(){
  background(172);
  fill(255);
  textSize(32);
  text(score, width/2, 36);
  
  for(int i = 0; i < snake.size(); i++){
    snake.get(i).update();
    strokeWeight(map(i, 0, snake.size(), 10, 1));
    snake.get(i).show();
  }
   
   apple.show();
   apple.update();
   
   if(gameOver()){
     println("Game Over. Your score was: ", score);
     setup();
   }   
}