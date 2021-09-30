class Repeat extends Command{
  int x = 330 , y = 30, w = 130, h = 30;
  String round ;
  Node repeat;
  Node command;
  String data;
  
  Repeat(String n){
    repeat = new Node("repeat");
    data = repeat.data;
    repeat.addLeft(n);
    repeat.addRight(null);
    round = n;
  }
  
  String getLeft(){
    return repeat.getLeft();
  }
  String getRight(){
    return repeat.getRight();
  }
  String getData(){
    return repeat.data;
  }
  
  void setRight(Node command){
    repeat.setRight(command);
  }
  Node getNode(){
    return repeat;
  }
  void display(){
    fill(155,155,155);
    stroke(1);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text("repeat = " + round , x+10, y+15);
  }
  
  boolean contains(){
    if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
      return true;
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
