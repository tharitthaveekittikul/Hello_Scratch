import java.util.Map;
import java.util.ArrayList;
import java.util.List;

Button conditionButton;
Button conditionElseButton;
Button repeatButton;
Button moveButton;
Button startButton;
Button flagButton;

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
Tree t;
ArrayList<Command> allBlock;
ArrayList<Command> Root;
ArrayList<Command> groupBlock;

void setup(){
  size(1600,900);
  cat = new Model();  
  
  //Button----------------------------------------------
  startButton = new Button("start",900,20,150,40);
  conditionButton = new Button("if :",50,50,230,40);
  conditionElseButton = new Button("if else:",50,100,230,40);
  repeatButton = new Button("repeat:",50,150,180,40);
  moveButton = new Button("Move:",50,200,150,40);
  flagButton = new Button("Run",50,5,150,40);
  
  //Textbox---------------------------------------------
  firstValBox = new TextBox(115,55,50,30,6);//if
  opIfBox = new TextBox(180,55,30,30,3);
  secondValBox = new TextBox(225,55,50,30,6);
  firstVal2Box = new TextBox(130,105,50,30,6);//if elsse 
  opIfElseBox = new TextBox(188,105,30,30,3);
  secondVal2Box = new TextBox(225,105,50,30,6);
  repeatBox = new TextBox(140,155,50,30,3);//repeat 
  moveStepBox = new TextBox(130,205,40,30,3);//move
  
  //Block-----------------------------------------------
  allBlock = new ArrayList<Command>();
  Root = new ArrayList<Command>();
  groupBlock = new ArrayList<Command>();  
   
}

//void checkFunction(Command c){
//  t.addchild(c.getNode());
//  for (int i=0 ; i < t.getStartNode().size() ; i++){
//    if( t.getStartNode().get(i).getData().equals("repeat") ){ //if function is Repeat
//      for ( int j=0 ; j < Integer.parseInt(t.getStartNode().get(i).getLeft()) ; j++){
//        if (t.getStartNode().get(i).getRight().equals("motion")){
//          //println(motions.get(motions.size()-1).getLeft());
//          cat.setStep(motions.get(motions.size()-1).getLeft());
//          cat.display();
//          println("step = " + j + " " + motions.get(motions.size()-1).getLeft() + " " + cat.x);
//          cat.Move();
          
//          draw();
//        }
//      }
//    }
//    if ( t.getStartNode().get(i).getData().equals("conditionif") ){
//      if (t.getStartNode().get(i).getLeft().equals("truth")){
        
//        if ( t.getStartNode().get(i).getNodeLeft().getLeft() == "true" ){
          
//         if (t.getStartNode().get(i).getRight().equals("motion")){
            
//            cat.setStep((motions.get(motions.size()-1).getLeft()));
//            cat.Move();
//          }
//        }
//      }
//    }
//  }
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
  
  //startButton-----------------------------------------------------------------------------------------------------------------
  if(startButton.pressed()){
    println("start");
    t = new Tree();
    //checkFunction(repeatList.get(repeatList.size()-1));
  }
  
  if(flagButton.pressed()){
      println("add flag");
      allBlock.add(new Root( "Run", str(Root.size()+1)));
      Root.add(new Root( "Run", str(Root.size()+1)));
  }
  
}

void mouseDragged(){
  //if Button-------------------------------------------------------------------------------------------------------------
  if (conditionButton.pressed()){
    if(firstValBox.getValue() != "" && checkOperator() && secondValBox.getValue() != ""){
      println("use if");
      allBlock.add(new ConditionIf("conditionIf", firstValBox.getValue(), opIfBox.getValue(), secondValBox.getValue()));
      firstValBox.resetTextvalue();
      opIfBox.resetTextvalue();
      secondValBox.resetTextvalue();
    }else{
      println("please insert value");
      //println(opIfBox.getValue());
    }
  }
  
  //if else Button------------------------------------------------------------------------------------------------------
  if (conditionElseButton.pressed()){
    if(firstVal2Box.getValue() != "" && checkOperator() && secondVal2Box.getValue() != ""){
      println("use if else");
      allBlock.add(new ConditionIfElse("conditionIfElse", firstVal2Box.getValue(), opIfElseBox.getValue(), secondVal2Box.getValue()));
      firstVal2Box.resetTextvalue();
      opIfElseBox.resetTextvalue();
      secondVal2Box.resetTextvalue();
    }else{
      println("please insert value");   
    }
  }
  
  //repeatButton---------------------------------------------------------------------------------------------------------------
  if(repeatButton.pressed()){
    if(repeatBox.getValue() != ""){
      println("use repeat");
      allBlock.add(new Repeat("repeat", repeatBox.getValue()));
      repeatBox.resetTextvalue();
       
         
    }else{
      println("please insert value");   
    }
  }
  
  //moveButton-----------------------------------------------------------------------------------------------------------------
  if(moveButton.pressed()){
    if(moveStepBox.getValue() != ""){
      println("use move");
      allBlock.add(new Motion("Move",moveStepBox.getValue()));
      moveStepBox.resetTextvalue();
      
      //repeatList.get(repeatList.size()-1).setRight(motions.get(motions.size()-1).motion);
    }else{
      println("please insert value");
    }
  }
  
}

void draw(){
  background(175);
  line(300,0,300,height); //left line
  line(1100,0,1100,height); //middle line
  line(1100,450,width,450); //horizontal line
  
  startButton.display();
  flagButton.display();
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
  sortBlockorder();
  connectBlock();
  runCat();   
  
  //Block-----------------------------------------
  for(int i = 0; i < allBlock.size(); i++){
      if(checklowerBlock(allBlock.get(i))){  //checklowerBlock 
        groupBlock = new ArrayList<Command>();
        dragTogether(allBlock.get(i), groupBlock);
        allBlock.get(i).setGroupSize(groupBlock.size());
        if(allBlock.get(i).contains()){
          allBlock.get(i).drag();
          for(int j = 0; j < groupBlock.size(); j++){
            groupBlock.get(j).setPosition(groupBlock.get(j).getX() +(mouseX - pmouseX),groupBlock.get(j).getY() +(mouseY - pmouseY)) ;
            groupBlock.get(j).display();
          }
        }
        //println(allBlock.get(i).getname()+" group :"+groupBlock);
        allBlock.get(i).display();
      }else{
        allBlock.get(i).setGroupSize(0);
        println("no group");
        allBlock.get(i).drag();
        allBlock.get(i).display();
      }
   }
  
  connectBlock();
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

boolean checkOperator(){
  if(opIfBox.getValue().equals("=") || opIfBox.getValue().equals(">") || 
  opIfBox.getValue().equals("<") || opIfBox.getValue().equals(">=") || 
  opIfBox.getValue().equals("<=") || opIfBox.getValue().equals("!=") ){
    //println("checkif");
    return true;
  }
  if(opIfElseBox.getValue().equals("=") || opIfElseBox.getValue().equals(">") || 
  opIfElseBox.getValue().equals("<") || opIfElseBox.getValue().equals(">=") || 
  opIfElseBox.getValue().equals("<=") || opIfElseBox.getValue().equals("!=") ){
    //println("checkifelse");
    return true;
  }
  return false;
}


void connectBlock(){
  int first_X;
  int first_Y;
  int second_X;
  int second_Y;
  int first_W;
  int second_W;
  int second_H;
  int groupsize;
  for(int i = 0; i < allBlock.size(); i++){
    for(int j = 0; j < allBlock.size(); j++){          
      first_X = allBlock.get(i).getX();
      first_Y = allBlock.get(i).getY();
      second_X = allBlock.get(j).getX();
      second_Y = allBlock.get(j).getY();
      first_W = allBlock.get(i).getW();
      second_W = allBlock.get(j).getW();
      second_H = allBlock.get(j).getH();
      groupsize = allBlock.get(i).getX();
      if(first_X != second_X || first_Y != second_Y){
        //if(allBlock.get(i).getname() == "conditionIfElse")
        //  groupsize += 1
        // right
        if(first_X > second_X && first_X < (second_X+second_W) && first_Y+5 > second_Y && first_Y+5 < (second_Y+second_H)){
          stroke(255,0,0);
          strokeWeight(4);
          line(second_X+(second_W/2), second_Y+second_H, second_X+second_W, second_Y+second_H);
          strokeWeight(1);
          if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X+(second_W/2), second_Y+second_H);
          }
        }
        // left
        else if((first_X+first_W) > second_X && (first_X+first_W) < (second_X+second_W) && first_Y+5 > second_Y && first_Y+5 < (second_Y+second_H)){
          stroke(255,0,0);
          strokeWeight(4);
          line(second_X, second_Y+second_H, second_X+(second_W/2), second_Y+second_H);
          strokeWeight(1);
          if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X-(allBlock.get(j).getW()/2), second_Y+(allBlock.get(j).getH()));
          }
        }
        // middle
        else if(first_X+(first_W/2) > second_X && first_X+(first_W/2) < (second_X+second_W) && first_Y > second_Y && first_Y < (second_Y+second_H)){
          stroke(255,0,0);
          strokeWeight(4);
          line(second_X, second_Y+second_H, second_X+second_W, second_Y+second_H);
          strokeWeight(1);
          if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X, second_Y+(allBlock.get(j).getH()));
          }
        }
      }
    }
  }
}

void sortBlockorder(){
  int firstBlock_Y;
  int secondBlock_Y;
  Command TempBlock;
  for(int i = 0; i < allBlock.size(); i++){
    for(int j = 0; j < allBlock.size(); j++){
      firstBlock_Y = allBlock.get(i).getY();
      secondBlock_Y = allBlock.get(j).getY();
      if(firstBlock_Y < secondBlock_Y){
          TempBlock = allBlock.get(i);
          allBlock.set(i, allBlock.get(j));
          allBlock.set(j, TempBlock);
      }
    }
  } 
  //println("after Update" + allBlock);
}


Boolean checklowerBlock(Command Block_i){
  Command upperBlock = Block_i;
  int upper_X;
  int upper_Y;
  int upper_W;
  int upper_H;
  int lower_X;
  int lower_Y;
  for(int i = 0; i < allBlock.size(); i++){
    upper_X = upperBlock.getX();
    upper_Y = upperBlock.getY();
    upper_W = upperBlock.getW();
    upper_H = upperBlock.getH();
    lower_X = allBlock.get(i).getX();
    lower_Y = allBlock.get(i).getY();
    if((lower_X == upper_X && lower_Y == upper_Y+upper_H) || (lower_X == upper_X+(upper_W/2) && lower_Y == upper_Y+upper_H) || (lower_X == upper_X-(upper_W/2) && lower_Y == upper_Y+upper_H)){
      return true;
    }
  }
  return false;
}

ArrayList<Command> dragTogether(Command Block_i ,ArrayList<Command> GroupBlock_){
  Command upperBlock = Block_i;
  ArrayList groupBlock = GroupBlock_;
  int upper_X;
  int upper_Y;
  int upper_W;
  int upper_H;
  int lower_X;
  int lower_Y;
  for(int i = 0; i < allBlock.size(); i++){
    upper_X = upperBlock.getX();
    upper_Y = upperBlock.getY();
    upper_W = upperBlock.getW();
    upper_H = upperBlock.getH();
    lower_X = allBlock.get(i).getX();
    lower_Y = allBlock.get(i).getY();
    if((lower_X == upper_X && lower_Y == upper_Y+upper_H)){
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }else if((lower_X == upper_X+(upper_W/2) && lower_Y == upper_Y+upper_H)){
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }else if((lower_X == upper_X-(upper_W/2) && lower_Y == upper_Y+upper_H)){
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }
  }
  return groupBlock;
}
