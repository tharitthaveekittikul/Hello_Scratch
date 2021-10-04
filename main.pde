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

Root start;

Node temp;

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

void traverse(Command c){
  for (int i = 0 ; i < c.getchildSize() ; i++){
    if ( c.getvalChild(i).equals("move") ){
      cat.setStep(c.getnodeChild(i).getvalChild(0));
      cat.Move();
    }
    if ( c.getvalChild(i).equals("repeat") ){
      int number = Integer.parseInt(c.getnodeChild(i).getvalChild(0)); //n of repeat
      for ( int j = 0 ; j < number ; j++) {
        traverse(c.getnodeChild(i));
      }
    }
    if ( c.getvalChild(i).equals("if") ){
      if ( c.getnodeChild(i).getvalChild(0).equals("TRUE")){
        traverse(c.getnodeChild(i)); 
      }
    }
    if ( c.getvalChild(i).equals("ifelse") ){
      if ( c.getnodeChild(i).getvalChild(0).equals("TRUE")){
        println("do ifelse => true");
        traverse(c.getnodeChild(i).getnodeChild(1)); 
      }
      if ( c.getnodeChild(i).getvalChild(0).equals("FALSE")){
        println("do ifelse => false");
        traverse(c.getnodeChild(i).getnodeChild(2)); 
      }
    }
  }
}

void getparent(Command c,Command cm){
  for (int i = 0 ; i < c.getchildSize() ; i++){
    if ( c.getvalChild(i).equals("move") ){
      println("Move by " + c.getnodeChild(i).getvalChild(0));
      if ( c.getnodeChild(i) == cm.getNode() ) {
        if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            break;
        }
        println("Found Laew Ja : " + c.getVal());
        break;
      }
    }
    if ( c.getvalChild(i).equals("repeat") ){
      int number = Integer.parseInt(c.getnodeChild(i).getvalChild(0)); //n of repeat
      println("Repeat by " + number );
      if ( c.getnodeChild(i) == cm.getNode() ) {
        if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            break;
        }
        println("Fond Laew Ja : " + c.getVal());
        break;
      }
      getparent(c.getnodeChild(i),cm);
    }
    if ( c.getvalChild(i).equals("if") ){
      if ( c.getnodeChild(i).getvalChild(0).equals("TRUE")){
        println("If Condition = TRUE ");
        if ( c.getnodeChild(i) == cm.getNode() ) {
          if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            break;
          }
          println("Fond Laew Ja : " + c.getVal());
          break;
        }
        getparent(c.getnodeChild(i),cm); 
      }
    }
    if ( c.getvalChild(i).equals("ifelse") ){
      temp = c.getnodeChild(i);
      println("IfElse Condition ");
        if ( c.getnodeChild(i) == cm.getNode() ) {
          if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){ 
            println("Fond Laew Ja : " + temp.getVal());
            break;
          }
          println("Fond Laew Ja : " + c.getVal());
          break;
        }
        getparent(c.getnodeChild(i).getnodeChild(1),cm); 
        getparent(c.getnodeChild(i).getnodeChild(2),cm);
      }
    }
}

void mouseClicked(){
  
  //startButton-----------------------------------------------------------------------------------------------------------------
  if(startButton.pressed()){
    //println("start");
    //traverse(start);
    //t = new Tree();

    //MANUAL1
    //Root start = new Root("run",str(Root.size()+1));
    //ConditionIfElse ie = new ConditionIfElse("ifelse","3",">","2");
    //Repeat r1 = new Repeat("repeat","3");
    //ie.addtrueCommand(r1.getNode());
    //Motion m1 = new Motion("move","10");
    //r1.addCommand(m1.getNode());
    //Motion m2 = new Motion("move","20");
    //ie.addfalseCommand(m2.getNode());
    //Motion m3 = new Motion("move","50");
    //r1.addCommand(m3.getNode());
    //start.addCommand(ie.getNode());
    //r1.removeCommand(m3.getNode());
    //traverse(start);
    //traversaltree(start,m1);

    //checkFunction(repeatList.get(repeatList.size()-1));

    //MANUAL TEST
    Root start = new Root("run",str(Root.size()+1));
    Repeat r1 = new Repeat("repeat","3");
    println("Start:" + start);
    println("r1:" + r1);
    println("r1 node :" + r1.getNode());
    start.addCommand(r1.getNode());
    ConditionIf if1 = new ConditionIf("if","3",">","2");
    Motion m1 = new Motion("move","10");
    println("if1:" +if1);
    println("m1:" +m1);
    println("m1 node:" +m1.getNode());
    if1.addCommand(m1.getNode());
    println("r1:" + r1);
    r1.addCommand(if1.getNode());
    println("r1 node: " + r1.getNode());
    ConditionIf if2 = new ConditionIf("if","3",">","2");
    println(start);
    start.addCommand(if2.getNode());
    ConditionIfElse ifelse = new ConditionIfElse("ifelse","3","<","2");
    if2.addCommand(ifelse.getNode());
    Motion m2 = new Motion("move","20");
    ifelse.addtrueCommand(m2.getNode());
    Motion m3 = new Motion("move","30");
    ifelse.addfalseCommand(m3.getNode());
    //println(start.getchildSize());
    traverse(start);
    println("========traversaltree========");
    getparent(start,m3);
    println("FINISH");
    
  }
  
  if(flagButton.pressed()){
      println("add flag");
      start = new Root("run",str(Root.size()+1));
      allBlock.add(start);      
      //Root.add(new Root( "Run", str(Root.size()+1)));
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
      //repeatList.add(new Repeat(repeatBox.getValue()));

    }else{
      println("please insert value");   
    }
  }
  
  //moveButton-----------------------------------------------------------------------------------------------------------------
  if(moveButton.pressed()){
    if(moveStepBox.getValue() != ""){
      println("use move");
      allBlock.add(new Motion("move",moveStepBox.getValue()));
      moveStepBox.resetTextvalue();

      
      //repeatList.get(repeatList.size()-1).setRight(motions.get(motions.size()-1).motion);

      
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
  String name_i;
  String name_j;
  //int groupsize;
  for(int i = 0; i < allBlock.size(); i++){
    for(int j = 0; j < allBlock.size(); j++){          
      first_X = allBlock.get(i).getX();
      first_Y = allBlock.get(i).getY();
      second_X = allBlock.get(j).getX();
      second_Y = allBlock.get(j).getY();
      first_W = allBlock.get(i).getW();
      second_W = allBlock.get(j).getW();
      second_H = allBlock.get(j).getH();
      //groupsize = allBlock.get(i).getX();
      name_i = allBlock.get(i).getname();
      name_j = allBlock.get(j).getname();
      if(first_X != second_X || first_Y != second_Y){ // Not same block 
        if(name_j == "repeat" || name_j == "conditionIf" || name_j == "conditionIfElse"){
          // right
          if(first_X > second_X && first_X < (second_X+second_W) && first_Y+5 > second_Y && first_Y+5 < (second_Y+second_H)){
            stroke(255,0,0);
            strokeWeight(4);
            line(second_X+(second_W/2), second_Y+second_H, second_X+second_W, second_Y+second_H);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
                allBlock.get(i).setPosition(second_X+(second_W/2), second_Y+second_H);
                allBlock.get(j).addCommand(allBlock.get(i).getNode());
            }
          }
        }
        if(name_j == "move"){
            // left
          if((first_X+first_W) > second_X && (first_X+first_W) < (second_X+second_W) && first_Y+5 > second_Y && first_Y+5 < (second_Y+second_H)){
            stroke(255,0,0);
            strokeWeight(4);
            line(second_X, second_Y+second_H, second_X+(second_W/2), second_Y+second_H);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
                allBlock.get(i).setPosition(second_X-(allBlock.get(j).getW()/2), second_Y+(allBlock.get(j).getH()));
            }
          }
            //middle
          if(first_X+(first_W/2) > second_X && first_X+(first_W/2) < (second_X+second_W) && first_Y > second_Y && first_Y < (second_Y+second_H)){
            stroke(255,0,0);
            strokeWeight(4);
            line(second_X, second_Y+second_H, second_X+second_W, second_Y+second_H);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
                allBlock.get(i).setPosition(second_X, second_Y+(allBlock.get(j).getH()));
            }
          }
        } 
        
        if(name_j == "run"){
            if(first_X+(first_W/2) > second_X && first_X+(first_W/2) < (second_X+second_W) && first_Y > second_Y && first_Y < (second_Y+second_H)){
            //middle
            stroke(255,0,0);
            strokeWeight(4);
            line(second_X, second_Y+second_H, second_X+second_W, second_Y+second_H);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
                allBlock.get(i).setPosition(second_X, second_Y+(allBlock.get(j).getH()));
                //println(allBlock.get(j));
                //println(allBlock.get(j).getNode());
                //println(allBlock.get(j).getname());
                //println(allBlock.get(i));
                //println(allBlock.get(i).getNode());
                //println(allBlock.get(i).getname());
                allBlock.get(j).addCommand(allBlock.get(i).getNode());    
            }
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
