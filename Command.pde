class Command{
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
}
