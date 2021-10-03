class Node extends Command{
  
  Node(String val_){
    val = val_;
    children = new ArrayList<Node>();
  }
}
