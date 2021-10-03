class ConditionIfElse extends Command{
  int w = 170, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
  String name;
  int variable1;
  String operator;
  int variable2;
  Node conditionifelse;
  Node ifTRUE;
  Node ifFALSE;
  ConditionIfElse(String name_, String v1_, String o_, String v2_){
    name = name_;
    variable1 = Integer.parseInt(v1_);
    operator = o_;
    variable2 = Integer.parseInt(v2_);
    
    conditionifelse = new Node(name);
    
    if (operator.equals("=")){
      if ( variable1 == variable2 ){
        conditionifelse.addnewChild("TRUE");
      } else {
        conditionifelse.addnewChild("FALSE");
      }
    }
    if (operator.equals(">")){
      if ( variable1 > variable2 ){
        conditionifelse.addnewChild("TRUE");
      } else {
        conditionifelse.addnewChild("FALSE"); 
      }
    }
    if (operator.equals("<")){
      if ( variable1 < variable2 ){
        conditionifelse.addnewChild("TRUE");
      } else {
        conditionifelse.addnewChild("FALSE");  
      }
    }
    
    ifTRUE = new Node("ifTRUE");
    ifFALSE = new Node("ifFALSE");
    
    conditionifelse.addexistChild(ifTRUE);
    conditionifelse.addexistChild(ifFALSE);
    
  }
  
  void addtrueCommand(Node command){
    ifTRUE.addexistChild(command);
  }
  void addfalseCommand(Node command){
    ifFALSE.addexistChild(command);
  }
  
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text( " If  : " + variable1 +"  "+ operator +"  "+ variable2, x+10, y+15);
  }
  Node getNode(){
    return conditionifelse;
  }
  
  boolean contains(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y + h){
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
