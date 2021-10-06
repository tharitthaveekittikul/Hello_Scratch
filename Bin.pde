class Bin{
  int x , y, w = 100, h = 80;
  PImage img;
  
  Bin(){
   img = loadImage("bin.png") ;
   x = 970 ;
   y = 750;
  }
  
  void display(){
    image(img,x,y,w,h);
    contains();
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
 
  
  boolean contains(){
    if(mousePressed){
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y + h){
        //x = x + (mouseX - pmouseX);
        //y = y + (mouseY - pmouseY);
        //println("true");
        return true;
      }
    }    
    return false;
  }
}
