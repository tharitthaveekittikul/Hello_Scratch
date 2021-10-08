class Repeat extends Command{
  int w = 200, h = 30;
  int x = mouseX-(w/2) , y = mouseY-(h/2);
  String name ;
  String round ;
  Node repeat;
  Node command;
  String val;
  
  Repeat(String name_, String n){
    name = name_ ;
    repeat = new Node(name);
    val = repeat.val; //"repeat"
    round = n;
    repeat.addnewChild(round);
  }

  
  void addCommand(Node command){
    repeat.addexistChild(command);
  }
  
  void removeCommand(Node command){
    repeat.removechild(command); 
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
  
  void setGroupSize(int groupsize_){
    groupsize = 1 + groupsize_ ;

  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  Node getNode(){
    return repeat;
  }
  
  int getchildSize(){
    return repeat.getchildSize();
  }
  
  String getvalChild(int n){ // n = index in children
    return repeat.getvalChild(n);
  }
  
  Node getnodeChild(int n){ // n = index in children
    return repeat.getnodeChild(n);
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
