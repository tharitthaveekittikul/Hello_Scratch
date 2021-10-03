class Command{
  int x , y;
  String val; //data
  ArrayList<Node> children;
  Node root;
  
  void addnewChild(String val){
    children.add(new Node(val));
  }
  
  void addexistChild(Node node){
    children.add(node); 
  }
  
  String getvalChild(int n){ // n = index in children
    return children.get(n).val;
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
}
