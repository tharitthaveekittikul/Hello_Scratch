class Model{
  int x , y, w = 100, h = 100;
  String step;
  PImage img;
  //String angle;
  float angle;
  
  Model(){
   img = loadImage("cat.png") ;
   x = 1150 ;
   y = 300;
   step = "0";
  }
  
  void display(){
    pushMatrix();
    translate(x,y);
    rotate(radians(angle));
    image(img,-25,-25,w,h);
    popMatrix();
    fill(0);
    textSize(16);
    text("Cat position x = " + x + " ,  y = " + y, 1130 ,430);
    contains();
  }
  
  void setStep(String step_){
    step = step_ ;   
  }
  
  int getStep(){
    return Integer.parseInt(step);
  }
  
  void setX(int x_){
    x = x_;
  }
  
  void setY(int y_){
    y = y_;
  }
  
  
  void Move(){
    x = x + getStep();
    println("move by " + x);
    delay(100);
  } 
  
  void Rotate(float angle_){
    angle = angle + angle_;
    println("rotate: " + angle);
  }
  
  void checkEdges(){
    if(x >= width){
      x = 1150;
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
