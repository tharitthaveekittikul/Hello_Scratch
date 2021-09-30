class Motion extends Command{
  int x = 330 , y = 30, w = 120, h = 30;
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
      }
    }  
  }
  
}
