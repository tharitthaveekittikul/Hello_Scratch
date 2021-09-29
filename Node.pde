class Node extends Command{
  
  Node(String data_){
    data = data_;
    leftChild = null;
    rightChild = null;
  }
  
  void addLeft(String left){
    leftChild = new Node(left);
  }
  void addRight(String right){
    rightChild = new Node(right);
  }
  
  
  
  void setLeft(Node leftnode){
    leftChild = leftnode;
  }
  
  void setRight(Node rightnode){
    rightChild = rightnode;
  }
}
