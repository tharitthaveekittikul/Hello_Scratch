class Root extends Command{
  int w = 200, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
  String order;
  String name;
  Node root;
  
  Root(String name_, String order_){
    order = order_;    
    name = name_ ;
    root = new Node(name);
  }
  
  void addCommand(Node command){
    root.addexistChild(command);
  }
  
  void removeCommand(Node command){
    root.removechild(command); 
  }
  
  int getchildSize(){
    return root.getchildSize();
  }
  
  String getvalChild(int n){ // n = index in children
    return root.getvalChild(n);
  }
  
  Node getnodeChild(int n){ // n = index in children
    return root.getnodeChild(n);
  }
  
  void display(){
    fill(#FAF884);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(name+"  "+order, x+10, y+15);
  }
  
  String getname(){
    return name;
  }
  
  String getVal(){
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
  
  Node getNode(){
    return root;
  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void drag(){
    if(mousePressed){
      x = x + (mouseX - pmouseX);
      y = y + (mouseY - pmouseY);
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
  
  boolean inBlock(){
    if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y + h){
      return true;
    }
    return false;
  }
}
