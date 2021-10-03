class Repeat extends Command{
  int w = 150, h = 30;
  int x = mouseX-(w/2) , y = mouseY-(h/2);
  String name ;
  String round ;
  Node repeat;
  Node command;
  String data;
  
  Repeat(String name_, String n){
    repeat = new Node("repeat");
    data = repeat.data;
    repeat.addLeft(n);
    repeat.addRight(null);
    round = n;
    name = name_ ;
  }
  
  String getLeft(){
    return repeat.getLeft();
  }
  String getRight(){
    return repeat.getRight();
  }
  String getData(){
    return repeat.data;
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
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
   
  
  void setRight(Node command){
    repeat.setRight(command);
  }
  Node getNode(){
    return repeat;
  }
  
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text("repeat = " + round , x+10, y+15);
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
