Segment head;
Segment body1;
Apple apple;
ArrayList<Segment> snake;
color red = color(255, 0, 0);
color green = color(0,150,0);
int score;

void setup(){
 size(600,800);
 score = 0;
 snake = new ArrayList<Segment>();
 apple = new Apple();
 head = new Segment(width/2, height/2, 20);
 snake.add(head);
 for(int i = 1; i < 4; i++){
   color f = green;
   if(i%2 == 0){f = red;}
   else{f = green;}
   body1 = new Segment(snake.get(i-1), 20, f);
   snake.add(body1);
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
 
 for(int i = 2; i < snake.size(); i++){
   if(doIntersect(snake.get(0).target, snake.get(0).position, snake.get(i).target, snake.get(i).position)){
     println("Game Over. Your score was: ", score);
     setup();
   }
 }
 if(edges()){
   println("Game Over. Your score was: ", score);
   setup();
 }
 apple.show();
 apple.update();
}

void keyPressed(){
  if(keyCode == RIGHT){
    snake.get(0).velocity.rotate(QUARTER_PI*.5);
  }
  if(keyCode == LEFT){
    snake.get(0).velocity.rotate(-QUARTER_PI*.5);
  }
}