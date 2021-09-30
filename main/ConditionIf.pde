class ConditionIf extends Command{
  int x = 330, y = 30, w = 150, h = 30;
  String name;
  int variable1;
  String operator;
  int variable2;
  Node conditionif;
  Node truth;
  Node command;
  Node TRUE;
  Node FALSE;
  ConditionIf(String name_, String v1_, String o_, String v2_){
    name = name_;
    variable1 = Integer.parseInt(v1_);
    operator = o_;
    variable2 = Integer.parseInt(v2_);
    
    conditionif = new Node(name);
    data = conditionif.data;
    
    truth = new Node("truth");
    truth.addLeft("helloworld"); //aw wai plean wa pen true or false for leak chai
    
    TRUE = new Node("true");
    FALSE = new Node("false");
    
    conditionif.addLeft(null);
    conditionif.addRight(null);
    
    conditionif.setLeft(truth);
    conditionif.setRight(command);
    
    if (operator.equals("==")){
      if ( variable1 == variable2 ){
        truth.setLeft(TRUE);
      } else {
        truth.setLeft(FALSE); 
      }
    }
    if (operator.equals(">")){
      if ( variable1 > variable2 ){
        truth.setLeft(TRUE);
      } else {
        truth.setLeft(FALSE); 
      }
    }
    if (operator.equals("<")){
      if ( variable1 < variable2 ){
        truth.setLeft(TRUE);
      } else {
        truth.setLeft(FALSE); 
      }
    }    
  }
  
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text( " If  : " + variable1 +"  "+ operator +"  "+ variable2, x+10, y+15);
  }
  
  String getLeft(){
    return conditionif.getLeft();
  }
  String getRight(){
    return conditionif.getRight();
  }
  String getData(){
    return conditionif.data;
  }
  
  void setRight(Node command){
    conditionif.setRight(command);
  }
  
  void setLeft(Node command){
    conditionif.setLeft(command); 
  }
  
  Node getNodeLeft(){
    return conditionif.leftChild;
  }
  
  Node getNodeRight(){
    return conditionif.rightChild;
  }
  Node getNode(){
    return conditionif;
  }
  
  boolean contains(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y + h){
        x = x + (mouseX - pmouseX);
        y = y + (mouseY - pmouseY);
        return true;
      }
    }    
    return false;
  }
  
  void drag(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        x = x + (mouseX - pmouseX);
        y = y + (mouseY - pmouseY);
      }
    }  
  }
}
