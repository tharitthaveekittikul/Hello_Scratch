class Tree extends Command{
  ArrayList<Node> startNode;
  Tree(){
    startNode = new ArrayList<Node>();
  }
  
  void addNode(Node command){
    startNode.add(command);
  }
  
  ArrayList<Node> getStartNode(){
    return startNode; 
  }
}
