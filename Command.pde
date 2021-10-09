class Command{
  int x, y, w, h;
  String val; //data
  ArrayList<Node> children;
  String name;
  String data;
  int groupsize = 1;
  Node root;
  
  void addnewChild(String val){
    children.add(new Node(val));
  }
  
  void addexistChild(Node node){
    children.add(node); 
  }
  
  void addCommand(Node n){
    root.addexistChild(n);
  }
  
  void removeCommand(Node n){
    root.removechild(n); 
  }
  
  void removechild(Node node){
    children.remove(node);
  }
  
  String getvalChild(int n){ // n = index in children
    return children.get(n).val;
  }

  String getname(){
    return name;
  }
  
  String getVal(){
    return val; 
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
  
  int getSize(){
    return groupsize;
  }

  Node getnodeChild(int n){ // n = index in children
    return children.get(n);
  }
  
  int getchildSize(){
    return children.size();
  }
  
  Node getNode(){
    return root;
  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void setGroupSize(int groupsize_){
    groupsize = 1 + groupsize_ ;
  }
  
  void display(){
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
