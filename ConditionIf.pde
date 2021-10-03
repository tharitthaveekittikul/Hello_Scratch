class ConditionIf extends Command{
  int w = 170, h = 30;
  int x = mouseX-(w/2), y = mouseY-(h/2);
  String name;
  int variable1;
  String operator;
  int variable2;
  Node conditionif;
  ConditionIf(String name_, String v1_, String o_, String v2_){
    name = name_;
    variable1 = Integer.parseInt(v1_);
    operator = o_;
    variable2 = Integer.parseInt(v2_);
    
    conditionif = new Node(name);
    
    if (operator.equals("=")){
      if ( variable1 == variable2 ){
        conditionif.addnewChild("TRUE");
      } else {
        conditionif.addnewChild("FALSE");
      }
    }
    if (operator.equals(">")){
      if ( variable1 > variable2 ){
        conditionif.addnewChild("TRUE");
      } else {
        conditionif.addnewChild("FALSE"); 
      }
    }
    if (operator.equals("<")){
      if ( variable1 < variable2 ){
        conditionif.addnewChild("TRUE");
      } else {
        conditionif.addnewChild("FALSE");  
      }
    }    
  }
  
  void addCommand(Node command){
    conditionif.addexistChild(command);
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
    return conditionif;
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
