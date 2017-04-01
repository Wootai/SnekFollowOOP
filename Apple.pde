class Apple{
  PVector position;
  float rad;
  color f;
  Apple(){
    position = new PVector(random(50, width-50), random(50, height-50));
    rad = 8;
  }
  
  void update(){
   if(PVector.dist(snake.get(0).target, position) < rad){
     score++;
     if(snake.size()%2 == 0){f = red;}
     else{f = green;}
     snake.add(new Segment(snake.get(snake.size()-1), snakepartLength, f));
     snake.get(0).velocity.mult(1.05);
     position.x = random(50, width-50);
     position.y = random(50, height-50);
     }
  }
  
  void show(){
    fill(red);
    noStroke();
    ellipse(position.x, position.y, rad, rad); 
  }
}