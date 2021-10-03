class Command{
  int x, y, w, h;
  String name;
  String data;
  int groupsize = 1;
  Node root;
  Node leftChild;
  Node rightChild;

  String getData(){
    return data;
  }
  
  String getLeft(){
    return leftChild.data;
  }
  String getRight(){
    return rightChild.data;
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
  
  int getSize(){
    return groupsize;
  }
   
  Node getNodeLeft(){
    return leftChild;
  }
  
  Node getNodeRight(){
    return rightChild;
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
  










 
