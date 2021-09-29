import java.util.Map;
import java.util.ArrayList;
import java.util.List;

Button conditionButton;
Button conditionElseButton;
Button repeatButton;
Button moveButton;
Button startButton;

TextBox moveStep;
TextBox  repeatBox;
//for conditionButton
TextBox firstVal;
TextBox opIf;
TextBox secondVal;
//for conditionElseButton
TextBox firstVal2;
TextBox opIfElse;
TextBox secondVal2;

Model cat;
Repeat r;
Motion m;
ConditionIf con;
Tree t;
ArrayList<Motion> motions;

ArrayList<Motion> moveList;
ArrayList<Repeat> repeatList;
ArrayList<ConditionIf> ifList;
ArrayList<ConditionIfElse> IfElseList;

void setup(){
  size(1600,900);
  cat = new Model();
  t = new Tree();
  motions = new ArrayList<Motion>();
  
  //Button----------------------------------------------
  startButton = new Button("start",900,20,150,40);
  conditionButton = new Button("if :",50,50,230,40);
  conditionElseButton = new Button("if else:",50,100,230,40);
  repeatButton = new Button("repeat:",50,150,180,40);
  moveButton = new Button("Move:",50,200,150,40);
  
   //Textbox---------------------------------------------
  firstVal = new TextBox(115,55,50,30,3);//if
  opIf = new TextBox(180,55,30,30,2);
  secondVal = new TextBox(225,55,50,30,3);
  ifList = new ArrayList<ConditionIf>();
  firstVal2 = new TextBox(130,105,50,30,3);//if elsse 
  opIfElse = new TextBox(188,105,30,30,2);
  secondVal2 = new TextBox(225,105,50,30,3);
  IfElseList = new ArrayList<ConditionIfElse>(); 
  repeatBox = new TextBox(140,155,50,30,3);//repeat 
  repeatList = new ArrayList<Repeat>();
  moveStep = new TextBox(130,205,40,30,3);//move
  moveList = new ArrayList<Motion>(); 
}

//void checkFunction(Command c){
  //Node right;
  //t.getStartNode().add(c.getNode());
  //for (int j=0 ; j < t.getStartNode().size() ; j++){
    //if( t.getStartNode().get(j).getData().equals("repeat") ){ //if function is Repeat
      //for ( int i=0 ; i < Integer.parseInt(t.getStartNode().get(j).getLeft()) ; i++){
        //if (t.getStartNode().get(j).getRight().equals("motion")){
          // cat.setStep(motions.get(motions.size()-1).getLeft());
          //cat.display();
          //println("step = " + i + " " + motions.get(motions.size()-1).getLeft() + " " + cat.x);
          //int oldd = second();
          //if ( second() == oldd+1 ){
          //  cat.Move();
          //}
          //cat.Move();
          
          //draw();
        //}
      //}
    //}
    //if ( t.getStartNode().get(j).getData().equals("conditionif") ){
      //if (t.getStartNode().get(j).getLeft().equals("truth")){
        
        //if ( t.getStartNode().get(j).getNodeLeft().getLeft() == "true" ){
          
         //if (t.getStartNode().get(j).getRight().equals("motion")){
            
           // cat.setStep((motions.get(motions.size()-1).getLeft()));
           // cat.Move();
          //}
        //}
      //}
    //}
  //}
//}

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
  
  //if Button-------------------------------------------------------------------------------------------------------------
  if (conditionButton.pressed()){
    if(checkEmpty()){
      println("use if");
      ifList.add(new ConditionIf("conditionIf", firstVal.getValue(), opIf.getValue(), secondVal.getValue()));
      firstVal.resetTextvalue();
      opIf.resetTextvalue();
      secondVal.resetTextvalue();
    }else{
      println("please insert value");
    }
    
  }
  //if else Button------------------------------------------------------------------------------------------------------
  if (conditionElseButton.pressed()){
    if(checkEmpty()){
      println("use if else");
      IfElseList.add(new ConditionIfElse("conditionIfElse", firstVal2.getValue(), opIfElse.getValue(), secondVal2.getValue())); 
      firstVal2.resetTextvalue();
      opIfElse.resetTextvalue();
      secondVal2.resetTextvalue();
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
    }else{
      println("please insert value");   
    }
  }
  
  //moveButton-----------------------------------------------------------------------------------------------------------------
  if(moveButton.pressed()){
    if(checkEmpty()){
      println("use move");
      moveList.add(new Motion("Move",moveStep.getValue()));
      moveStep.resetTextvalue();
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
  //startButton-----------------------------------------------------------------------------------------------------------------
  if(startButton.pressed()){
    println("start");
    
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
  firstVal.draw();
  opIf.draw();
  secondVal.draw();
  firstVal2.draw();
  opIfElse.draw();
  secondVal2.draw();
  moveStep.draw();
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
  for(int i = 0; i < moveList.size(); i++){
       moveList.get(i).display();
       moveList.get(i).drag();
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
  if(moveStep.getValue() != "" || repeatBox.getValue() != ""){
    return true;
  }else if(firstVal.getValue() != "" && opIf.getValue() != "" && secondVal.getValue() != ""){
    return true;
  }else if(firstVal2.getValue() != "" && opIfElse.getValue() != "" && secondVal2.getValue() != ""){
    return true;
  }
  return false;
}
