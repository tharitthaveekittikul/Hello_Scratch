class Repeat extends Command{
  int w = 130, h = 30;
  int x = mouseX-(w/2) , y = mouseY-(h/2);
  String round ;
  Node repeat;
  Node command;
  String val;
  String name;
  
  Repeat(String name_, String n){
    name = name_;
    repeat = new Node(name);
    val = repeat.val; //"repeat"
    round = n;
    repeat.addnewChild(round);
  }

  
  void addCommand(Node command){
    repeat.addexistChild(command);
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
