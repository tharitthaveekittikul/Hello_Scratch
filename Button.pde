class Button{
  int x,y,w,h ;
  String name;
  Button(String name_,int x_, int y_, int w_, int h_){
    name = name_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }  
  
  void display(){
    
    fill(255);
    rect(x,y,w,h);
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(name,x+50,y+25);
    
  }
  
  boolean pressed(){
    if(name == "if :"){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
        //return to main mouseClick()
        return true;
      }
    }
    if(name == "if else:"){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
        //return to main mouseClick()
        return true;
      }
    }
    if(name == "repeat:"){
      if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
        //return to main mouseClick()
        return true;
      }
    }
    if (name == "Move:"){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        //return to main mouseClick()
        return true;
      }
    }
    if (name == "start"){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        //return to main mouseClick()
        return true;
      }
    }
    if (name == "Run"){
      if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
        //return to main mouseClick()
        return true;
      }
    }
    return false;
  }  
}
  
  
