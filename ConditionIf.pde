class ConditionIf extends Command{
  int w = 200, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
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
   
    
    if (operator.equals("=")){
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
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
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
