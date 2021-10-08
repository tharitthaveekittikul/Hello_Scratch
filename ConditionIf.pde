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
  
  void removeCommand(Node command){
    conditionif.removechild(command); 
  }
  
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text( " If  : " + variable1 +"  "+ operator +"  "+ variable2, x+10, y+15);
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
  
  int getchildSize(){
    return conditionif.getchildSize();
  }
  
  String getvalChild(int n){ // n = index in children
    return conditionif.getvalChild(n);
  }
  
  Node getnodeChild(int n){ // n = index in children
    return conditionif.getnodeChild(n);
  }
  
  void setGroupSize(int groupsize_){
    groupsize = 1 + groupsize_ ;

  }
  
  void setPosition(int x_, int y_){
    x = x_;
    y = y_;
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
