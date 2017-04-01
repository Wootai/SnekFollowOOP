class Segment {
   PVector position;
   PVector target;
   float angle;
   float len;
   color col;
   Segment parent;
   PVector velocity;
   
   Segment(float x, float y, float l){
     position = new PVector(x, y);
     velocity = new PVector(1.525, .5);
     target = velocity.copy().add(position);
     len = l;
     col = red;
   }

   Segment(Segment c, float l, color _col){
     parent = c;
     target = c.target.copy();
     position = new PVector();
     len = l;
     col = _col;
   }
   
   void update(){
     if(parent!= null){
       target.x = parent.position.x; 
       target.y = parent.position.y; 
     }
     else{
      target.add(velocity);
    }
    
    float dx = target.x - position.x;
    float dy = target.y - position.y;
    
    angle = atan2(dy, dx);
    
    position.x = target.x-cos(angle)*len;
    position.y = target.y-sin(angle)*len;

   }
   
    void show() {
      stroke(col);
      line(position.x, position.y, target.x, target.y);
    }
}