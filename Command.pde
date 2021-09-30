class Command{
  int x , y;
  String data;
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
}
