void keyPressed(){
  if(keyCode == RIGHT){
    snake.get(0).velocity.rotate(QUARTER_PI*.5);
  }
  if(keyCode == LEFT){
    snake.get(0).velocity.rotate(-QUARTER_PI*.5);
  }
}