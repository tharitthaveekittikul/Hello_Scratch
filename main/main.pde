//testjaa
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

Button conditionButton;
Button conditionElseButton;
Button repeatButton;
Button moveButton;
Button startButton;

TextBox moveStepBox;
TextBox repeatBox;
//for conditionButton
TextBox firstValBox;
TextBox opIfBox;
TextBox secondValBox;
//for conditionElseButton
TextBox firstVal2Box;
TextBox opIfElseBox;
TextBox secondVal2Box;

Model cat;
//Repeat r;
//Motion m;
//ConditionIf con;
Tree t;
ArrayList<Motion> motions;

ArrayList<Repeat> repeatList;
ArrayList<ConditionIf> ifList;
ArrayList<ConditionIfElse> IfElseList;

void setup(){
  size(1600,900);
  cat = new Model();  
  
  //Button----------------------------------------------
  startButton = new Button("start",900,20,150,40);
  conditionButton = new Button("if :",50,50,230,40);
  conditionElseButton = new Button("if else:",50,100,230,40);
  repeatButton = new Button("repeat:",50,150,180,40);
  moveButton = new Button("Move:",50,200,150,40);
  
   //Textbox---------------------------------------------
  firstValBox = new TextBox(115,55,50,30,3);//if
  opIfBox = new TextBox(180,55,30,30,2);
  secondValBox = new TextBox(225,55,50,30,3);
  ifList = new ArrayList<ConditionIf>();
  firstVal2Box = new TextBox(130,105,50,30,3);//if elsse 
  opIfElseBox = new TextBox(188,105,30,30,2);
  secondVal2Box = new TextBox(225,105,50,30,3);
  IfElseList = new ArrayList<ConditionIfElse>(); 
  repeatBox = new TextBox(140,155,50,30,3);//repeat 
  repeatList = new ArrayList<Repeat>();
  moveStepBox = new TextBox(130,205,40,30,3);//move
  motions = new ArrayList<Motion>();
}

void checkFunction(Command c){
  t.addchild(c.getNode());
  for (int j=0 ; j < t.getStartNode().size() ; j++){
    if( t.getStartNode().get(j).getData().equals("repeat") ){ //if function is Repeat
      for ( int i=0 ; i < Integer.parseInt(t.getStartNode().get(j).getLeft()) ; i++){
        if (t.getStartNode().get(j).getRight().equals("motion")){
          //println(motions.get(motions.size()-1).getLeft());
           cat.setStep(motions.get(motions.size()-1).getLeft());
          cat.display();
          println("step = " + i + " " + motions.get(motions.size()-1).getLeft() + " " + cat.x);
          cat.Move();
          
          draw();
        }
      }
    }
    if ( t.getStartNode().get(j).getData().equals("conditionif") ){
      if (t.getStartNode().get(j).getLeft().equals("truth")){
        
        if ( t.getStartNode().get(j).getNodeLeft().getLeft() == "true" ){
          
         if (t.getStartNode().get(j).getRight().equals("motion")){
            
            cat.setStep((motions.get(motions.size()-1).getLeft()));
            cat.Move();
          }
        }
      }
    }
  }
  
}

void mouseClicked(){
  //if(true){ //pressed repeat button and parameter 3

    //r = new Repeat("3");
    //motions.add(new Motion("10"));
    //println("repeatmain = " + r.getLeft());
    //r.setRight(motions.get(motions.size()-1).motion);
    ////do work
    ////println("stepmain = " + m.getLeft());
    //checkFunction(r);
    
    //motion in if
    //con = new ConditionIf("3","==","3");
    //motions.add(new Motion("Move","40"));
    //con.setRight(motions.get(motions.size()-1).motion);
    //println(con.getNodeLeft());
    //checkFunction(con);
  //}
  

  //startButton-----------------------------------------------------------------------------------------------------------------
  if(startButton.pressed()){
    println("start");
    t = new Tree();
    checkFunction(repeatList.get(repeatList.size()-1));
    
  }
}

void mouseDragged(){
  //if Button-------------------------------------------------------------------------------------------------------------
  if (conditionButton.pressed()){
    if(checkEmpty()){
      println("use if");
      ifList.add(new ConditionIf("conditionIf", firstValBox.getValue(), opIfBox.getValue(), secondValBox.getValue()));
      firstValBox.resetTextvalue();
      opIfBox.resetTextvalue();
      secondValBox.resetTextvalue();
    }else{
      println("please insert value");
    }
    
  }
  //if else Button------------------------------------------------------------------------------------------------------
  if (conditionElseButton.pressed()){
    if(checkEmpty()){
      println("use if else");
      IfElseList.add(new ConditionIfElse("conditionIfElse", firstVal2Box.getValue(), opIfElseBox.getValue(), secondVal2Box.getValue())); 
      firstVal2Box.resetTextvalue();
      opIfElseBox.resetTextvalue();
      secondVal2Box.resetTextvalue();
    }else{
      println("please insert value");   
    }
  }
  
  //repeatButton---------------------------------------------------------------------------------------------------------------
  if(repeatButton.pressed()){
    if(checkEmpty()){
      println("use repeat");
      repeatList.add(new Repeat(repeatBox.getValue()));
      repeatBox.resetTextvalue();
      //-------PAO ADD------
      
      
    }else{
      println("please insert value");   
    }
  }
  
  //moveButton-----------------------------------------------------------------------------------------------------------------
  if(moveButton.pressed()){
    if(checkEmpty()){
      println("use move");
      motions.add(new Motion("Move",moveStepBox.getValue()));
      moveStepBox.resetTextvalue();
      
      //-------PAO ADD-------
      
      repeatList.get(repeatList.size()-1).setRight(motions.get(motions.size()-1).motion);
      
    }else{
      println("please insert value");
    }
    //if(moveList.size() < 1 ){
    //  println("use move");
    //  moveList.add(new Motion("Move",moveStep.getValue(),330,30));
    //}else if(moveList.size() >=1){
    //  int oldX = moveList.get(moveList.size() - 1).getX() ;
    //  int oldY = moveList.get(moveList.size() - 1).getY() ;
    //  if(oldX == 330 && oldY == 30){
    //    moveList.add(new Motion("Move",moveStep.getValue(),330,moveList.get(moveList.size() - 1).getY()+60));
    //  }else{
    //    moveList.add(new Motion("Move",moveStep.getValue(),330,30));
    //  }
    //}
  }
}
void draw(){
  background(175);
  line(300,0,300,height); //left line
  line(1100,0,1100,height); //middle line
  line(1100,450,width,450); //horizontal line
  
  startButton.display();
  //condition if (left:true/false , middle:true statement , right:false statement)
  conditionButton.display();
  //conditionElse
  conditionElseButton.display();
  //repeat
  repeatButton.display();
  //moves
  moveButton.display();
  
  //TextBox--------------------
  firstValBox.draw();
  opIfBox.draw();
  secondValBox.draw();
  firstVal2Box.draw();
  opIfElseBox.draw();
  secondVal2Box.draw();
  moveStepBox.draw();
  repeatBox.draw();
  runCat();
  
  //ConditionIf Block-----------------------------------------
  for(int i = 0; i < ifList.size(); i++){
       ifList.get(i).display();
       ifList.get(i).drag();
   }
   
   //ConditionIfElse Block-----------------------------------------
  for(int i = 0; i < IfElseList.size(); i++){
       IfElseList.get(i).display();
       IfElseList.get(i).drag();
   }
  
  //repeat Block----------------------------------------
  for(int i = 0; i < repeatList.size(); i++){
       repeatList.get(i).display();
       repeatList.get(i).drag();
   }
   
   //Move Block-----------------------------------------
  for(int i = 0; i < motions.size(); i++){
       motions.get(i).display();
       motions.get(i).drag();
   }
  
  showCoordinates();
}

void runCat(){
  cat.display();
  cat.checkEdges();
}

void showCoordinates(){
  fill(0);
  textSize(16);
  text("x: " + mouseX + "   y = " + mouseY,width/2 - 80,height - 50);
}

boolean checkEmpty(){
  if(moveStepBox.getValue() != "" || repeatBox.getValue() != ""){
    return true;
  }else if(firstValBox.getValue() != "" && opIfBox.getValue() != "" && secondValBox.getValue() != ""){
    return true;
  }else if(firstVal2Box.getValue() != "" && opIfElseBox.getValue() != "" && secondVal2Box.getValue() != ""){
    return true;
  }
  return false;
}
