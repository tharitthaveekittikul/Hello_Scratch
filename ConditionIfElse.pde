class ConditionIfElse extends Command{
  int w = 200, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2) ;
  int offset;
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
  
  String getLeft(){
    return conditionifelse.getLeft();
  }
  String getRight(){
    return conditionifelse.getRight();
  }
  String getData(){
    return conditionifelse.data;
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
  
  void setGroupSize(int groupsize_){
    groupsize = 1 + groupsize_ ;

  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
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
  
  void display(){
    offset = h*groupsize;
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text( " If : " + variable1 +"  "+ operator +"  "+ variable2, x+10, y+15);
    fill(155,155,155);
    stroke(1);
    rect(x,y+offset,w,h);
    fill(0);
    textSize(20);
    text( " Else : ", x+5, y+offset+15); 
    
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
