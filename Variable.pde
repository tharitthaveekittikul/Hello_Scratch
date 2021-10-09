import java.util.Map;
import java.util.*;
class Variable extends Command{
  Map variable;
  int x , y;
  int index;
  Set set;
  Iterator iter;
  Variable(){
    x = 1140;
    y = 490;
    index = 0;
    //y = y_;
    variable = new HashMap<String,String>();
  }
  
  Variable(int y_){
    x = 1140;
    y = y_;
    variable = new HashMap<String,String>();
  }
  
  void put(String keyname, String value){
    variable.put(keyname,value);
    //println(variable.get(keyname).getClass().getName());
  }
  
  String getValue(String keyname){
    return String.valueOf(variable.get(keyname));
  }
  
  void changeValue(String keyname,int value){
    println(variable.get(keyname).getClass().getName());
    variable.put(keyname, Integer.parseInt(getValue(keyname)) + value);
  }
  
  void setValue(String keyname,String value){
    variable.replace(keyname,value);
  }
  
  void display(){
    fill(0);
    textSize(20);
    text(variable.keySet().toArray()[0] + " = " + variable.get(variable.keySet().toArray()[0]),x,y);   
  }
  
  int getY(){
    return y;
  }
  
  int getSize(){
    return variable.size();
  }
  
  String getKey(){
    return (String)variable.keySet().toArray()[0];
  }
}
