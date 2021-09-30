class Model{
  int x , y, w = 100, h = 100;
  String step;
  PImage img;
  
  Model(){
   img = loadImage("cat.png") ;
   x = 1125 ;
   y = 300;
   step = "0";
  }
  
  void display(){
    fill(175);
    image(img,x,y,w,h);
    fill(0);
    textSize(16);
    text("x = " + x + " ,  y = " + y, x + 55,y - 10);
    contains();
  }
  
  void setStep(String step_){
    step = step_ ;   
  }
  
  int getStep(){
    return Integer.parseInt(step);
  }
  
  
  void Move(){
    x = x + getStep();
    println("move by " + x);
  } 
  
  void checkEdges(){
    if(x >= width){
      x = 1125;
    }
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
}
