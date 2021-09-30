class Motion extends Command{
  int w = 120, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
  String step ;
  String name;
  Node motion;
  Motion(String name_, String step_){
    motion = new Node("motion");
    step = step_ ;
    motion.addLeft(step);
    name = name_ ;
  }
  
  String getLeft(){
    return motion.getLeft();
  }

  String getData(){
    return motion.data;
  }
   void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(name + " = " + step , x+10, y+15);
  }
  
  int getX(){
    return x ;
  }
  
  int getY(){
    return y ; 
  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  boolean contains(){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
      println("in Motion");
      return true;
    }
    return false;
  }
  
  void drag(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        x = x + (mouseX - pmouseX);
        y = y + (mouseY - pmouseY);
        //return true;
      }
    }
  }
  
}
