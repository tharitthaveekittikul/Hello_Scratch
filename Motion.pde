class Motion extends Command{
  int w = 150, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
  String step ;
  String name;
  Node motion;
  
  Motion(String name_, String step_){
    motion = new Node(name_);
    step = step_ ;
    motion.addnewChild(step);
    name = name_ ;
  }
  
  String getStep(){
    return motion.getvalChild(0); //get child of motion (step)
  }

  String getVal(){
    return motion.val; //string "motion"
  }
  
  Node getNode(){
    return motion; 
  }
  
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(name + " = " + step , x+10, y+15);
  }
  
  String getname(){
    return name;
  }
  
  int getX(){
    return x ;
  }
  
  int getY(){
    return y ; 
  }
  
  int getW(){
    return w;
  }
  
  int getH(){
    return h;
  }
  
  int getchildSize(){
    return motion.getchildSize();
  }
  
  String getvalChild(int n){ // n = index in children
    return motion.getvalChild(n);
  }
  
  Node getnodeChild(int n){ // n = index in children
    return motion.getnodeChild(n);
  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void drag(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        x = x + (mouseX - pmouseX);
        y = y + (mouseY - pmouseY);
      }
    }
  }
  
  boolean contains(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y + h){
        return true;
      }
    }    
    return false;
  }
  
}
