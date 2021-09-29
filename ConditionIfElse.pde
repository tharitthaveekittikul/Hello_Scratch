class ConditionIfElse extends Command{
  int x = 330, y = 30, w = 150, h = 30;
  String name;
  int variable1;
  String operator;
  int variable2;
  Node conditionifelse;
  Node truth;
  Node commandtrue;
  Node commandfalse;
  Node TRUE;
  Node FALSE;
  ConditionIfElse(String name_, String v1_ , String o_ , String v2_){
    name = name_;
    variable1 = Integer.parseInt(v1_);
    operator = o_;
    variable2 = Integer.parseInt(v2_);
    
    conditionifelse = new Node(name);
    data = conditionifelse.data;
    
    truth = new Node("truth");
    truth.addLeft("helloworld"); //aw wai plean wa pen true or false for leak chai
    
    TRUE = new Node("true");
    FALSE = new Node("false");
    
    conditionifelse.addLeft(null);
    conditionifelse.addRight(null);
    
    conditionifelse.setLeft(truth);
    //conditionifelse.setRight(command);
    
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
    text( " If : " + variable1 +"  "+ operator +"  "+ variable2, x+10, y+15);
    fill(155,155,155);
    stroke(1);
    rect(x,y+60,w,h);
    fill(0);
    textSize(20);
    text( " Else : ", x+5, y+75); 
    
  }
  
  String getLeft(){
    return conditionifelse.getLeft();
  }
  String getRight(){
    return conditionifelse.getRight();
  }
  String getData(){
    return conditionifelse.data;
  }
  
  void setRight(Node command){
    conditionifelse.setRight(command);
  }
  
  void setLeft(Node command){
    conditionifelse.setLeft(command); 
  }
  
  Node getNodeLeft(){
    return conditionifelse.leftChild;
  }
  
  Node getNodeRight(){
    return conditionifelse.rightChild;
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
      if((mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) || (mouseX >= x && mouseX <= x + w && mouseY >= y + 60 && mouseY <= y + 60 + h)){
        x = x + (mouseX - pmouseX);
        y = y + (mouseY - pmouseY);
      }
    }  
  }
}
