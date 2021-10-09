import java.util.Map;
import java.util.ArrayList;
import java.util.List;

Button conditionButton;
Button conditionElseButton;
Button repeatButton;
Button moveButton;
Button rotateButton;
Button startButton;
Button flagButton;
Button setButton;
Button setXButton;
Button setYButton;

TextBox moveStepBox;
TextBox angleBox;
TextBox repeatBox;
//for conditionButton
TextBox firstValBox;
TextBox opIfBox;
TextBox secondValBox;
//for conditionElseButton
TextBox firstVal2Box;
TextBox opIfElseBox;
TextBox secondVal2Box;
TextBox keynameBox;
TextBox valueBox;
TextBox setXBox;
TextBox setYBox;

Model cat;
Bin bin;
Tree t;
ArrayList<Command> allBlock;
ArrayList<Command> Root;
ArrayList<Command> groupBlock;

Root start;
Node temp;

//ArrayList<Variable> variables;
Variable variable;
ArrayList<Variable> variables;
int var_y;


void setup(){
  size(1600,900);
  cat = new Model();  
  bin = new Bin();
  
  //Button----------------------------------------------
  startButton = new Button("start",900,20,150,40);
  conditionButton = new Button("if :",50,50,230,40);
  conditionElseButton = new Button("if else:",50,100,230,40);
  repeatButton = new Button("repeat:",50,150,180,40);
  moveButton = new Button("Move:",50,200,150,40);
  rotateButton = new Button("Rotate:",50,250,150,40);
  flagButton = new Button("Run",50,5,150,40);
  setButton = new Button("Set",240,295,50,30);
  setXButton = new Button("Set X:",50,335,150,40);
  setYButton = new Button("Set Y:",50,385,150,40);
  
  //Textbox---------------------------------------------
  firstValBox = new TextBox(115,55,50,30,10);//if
  opIfBox = new TextBox(180,55,30,30,3);
  secondValBox = new TextBox(225,55,50,30,6);
  firstVal2Box = new TextBox(130,105,50,30,10);//if elsse 
  opIfElseBox = new TextBox(188,105,30,30,3);
  secondVal2Box = new TextBox(225,105,50,30,6);
  repeatBox = new TextBox(140,155,50,30,10);//repeat 
  moveStepBox = new TextBox(130,205,40,30,10);//move
  angleBox = new TextBox(130,255,40,30,10); //rotate
  keynameBox = new TextBox(10,295,100,30,10);
  valueBox = new TextBox(130,295,100,30,10);
  setXBox = new TextBox(120,340,50,30,10);
  setYBox = new TextBox(120,390,50,30,10);
  
  //Block-----------------------------------------------
  allBlock = new ArrayList<Command>();
  Root = new ArrayList<Command>();
  groupBlock = new ArrayList<Command>();  
  
  //variables = new ArrayList<Variable>();
  variables = new ArrayList<Variable>();
  var_y = 490;
  
  //keys = new ArrayList(variables.variable.keySet());
   
}

void traverse(Command c){
  for (int i = 0 ; i < c.getchildSize() ; i++){
    if ( c.getvalChild(i).equals("move") ){
      cat.setStep(c.getnodeChild(i).getvalChild(0));
      runCat();
      cat.Move();
      
    }
    if ( c.getvalChild(i).equals("rotate") ){
      //cat.setAngle(c.getnodeChild(i).getvalChild(0));
      runCat();
      cat.Rotate(Float.parseFloat(c.getnodeChild(i).getvalChild(0)));
    }
    if ( c.getvalChild(i).equals("setX") ){
      //cat.setAngle(c.getnodeChild(i).getvalChild(0));
      runCat();
      cat.setX(Integer.parseInt(c.getnodeChild(i).getvalChild(0)));
    }
    if ( c.getvalChild(i).equals("setY") ){
      //cat.setAngle(c.getnodeChild(i).getvalChild(0));
      runCat();
      cat.setY(Integer.parseInt(c.getnodeChild(i).getvalChild(0)));
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
  if(startButton.pressed()){
    println("start");
    traverse(start);
  }
    
    //variables.get(0).changeValue(variables.get(0).getKey(),10);
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

    //////MANUAL TEST
    //Root start = new Root("run",str(Root.size()+1));
    //Repeat r1 = new Repeat("repeat","3");
    //println("Start:" + start);
    //println("r1:" + r1);
    //println("r1 node :" + r1.getNode());
    //start.addCommand(r1.getNode());
    //ConditionIf if1 = new ConditionIf("if","3",">","2");
    //Motion m1 = new Motion("move","10");
    //println("if1:" +if1);
    //println("m1:" +m1);
    //println("m1 node:" +m1.getNode());
    //if1.addCommand(m1.getNode());
    //println("r1:" + r1);
    //r1.addCommand(if1.getNode());
    //println("r1 node: " + r1.getNode());
    //ConditionIf if2 = new ConditionIf("if","3",">","2");
    //println(start);
    //start.addCommand(if2.getNode());
    //ConditionIfElse ifelse = new ConditionIfElse("ifelse","3","<","2");
    //if2.addCommand(ifelse.getNode());
    //Motion m2 = new Motion("move","20");
    //ifelse.addtrueCommand(m2.getNode());
    //Motion m3 = new Motion("move","30");
    //ifelse.addfalseCommand(m3.getNode());
    ////println(start.getchildSize());
    //traverse(start);
    //println("========traversaltree========");
    //getparent(start,m3);
    //println("FINISH");
  //}
  
  if(flagButton.pressed()){
      println("add flag");
      start = new Root("run",str(Root.size()+1));
      allBlock.add(start);
      //Root.add(new Root( "Run", str(Root.size()+1)));
  }
  
  if(setButton.pressed()){
    println("Set");
    if(keynameBox.getValue() != "" && valueBox.getValue() != ""){
      variable = new Variable(var_y);
      variable.put(keynameBox.getValue(),valueBox.getValue());
      for(int i = 0 ; i < variables.size() ; i++){
        if(keynameBox.getValue().equals(variables.get(i).getKey())){
          variables.get(i).setValue(variables.get(i).getKey(),variable.getValue(variable.getKey()));
          keynameBox.resetTextvalue();
          valueBox.resetTextvalue();
          return;
        }
      }
      variables.add(variable);
      var_y += 20;
      keynameBox.resetTextvalue();
      valueBox.resetTextvalue();
   }
  }
  
}



void mouseDragged(){
  //if Button-------------------------------------------------------------------------------------------------------------
  if (conditionButton.pressed()){
    if(firstValBox.getValue() != "" && checkOperator() && secondValBox.getValue() != ""){
      println("use if");
      String keyname = firstValBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(firstValBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new ConditionIf("if", keyname, opIfBox.getValue(), secondValBox.getValue()));
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
      String keyname = firstVal2Box.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(firstVal2Box.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new ConditionIfElse("ifelse", keyname, opIfElseBox.getValue(), secondVal2Box.getValue()));
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
      String keyname = repeatBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(repeatBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new Repeat("repeat", keyname));
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
      String keyname = moveStepBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(moveStepBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new Motion("move",keyname));
      moveStepBox.resetTextvalue();

      
      //repeatList.get(repeatList.size()-1).setRight(motions.get(motions.size()-1).motion);

      
      //repeatList.get(repeatList.size()-1).setRight(motions.get(motions.size()-1).motion);
    }else{
      println("please insert value");
    }
  }
  if(rotateButton.pressed()){
    if(angleBox.getValue() != ""){
      println("use rotate");
      String keyname = angleBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(angleBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new Motion("rotate",keyname));
      angleBox.resetTextvalue();
    }
    else{
      println("please insert value");
    }
    
  }
  if(setXButton.pressed()){
    if(setXBox.getValue() != ""){
      println("use setX");
      String keyname = setXBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(setXBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new Motion("setX",keyname));
      setXBox.resetTextvalue();
    }
    else{
      println("please insert value");
    }
    
  }
  if(setYButton.pressed()){
    if(setYBox.getValue() != ""){
      println("use setY");
      String keyname = setYBox.getValue();
      for(int i = 0 ; i < variables.size(); i++){
        if(setYBox.getValue().equals(variables.get(i).getKey())){
          keyname = String.valueOf(variables.get(i).getValue(variables.get(i).getKey()));
        }
      }
      allBlock.add(new Motion("setY",keyname));
      setYBox.resetTextvalue();
    }
    else{
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
  rotateButton.display();
  setButton.display();
  setXButton.display();
  setYButton.display();
  
  //TextBox--------------------
  firstValBox.draw();
  opIfBox.draw();
  secondValBox.draw();
  firstVal2Box.draw();
  opIfElseBox.draw();
  secondVal2Box.draw();
  moveStepBox.draw();
  angleBox.draw();
  repeatBox.draw();
  keynameBox.draw();
  setXBox.draw();
  setYBox.draw();
  fill(0);
  textSize(20);
  text("=",115,307);
  valueBox.draw();
  sortBlockorder();
  runCat();   
  bin.display();
  
  //variables.display();
  //for(int i = 0 ; i < variables.getSize();i++){
  //  println(variables.variable.keySet().toArray()[i]); // keyname
  //  text(variables.variable.keySet().toArray()[i] + " = " + variables.variable.get(variables.variable.keySet().toArray()[i]),1140,var_y);
  //  if(setButton.contains()){
  //    var_y += 20;    
  //  }
  //}
  for(int i = 0 ; i < variables.size() ; i++){
    //println(variables);
    variables.get(i).display();
  }
  
  
  
  //for(int i = 0; i < variables.size();i++){
  //  variables.get(i).display();
  //}
  
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
        println(allBlock.get(i).getname()+" group :"+groupBlock);
        allBlock.get(i).display();
      }else{
        allBlock.get(i).setGroupSize(0);
        connectBlock();
        //println("no group");
        allBlock.get(i).drag();
        allBlock.get(i).display();
      }
   }
  connectBlock();
  useBin();
  showCoordinates();
  
}


void runCat(){
  cat.display();
  cat.checkEdges();
  //cat.Rotate(1);
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
    return true;
  }
  if(opIfElseBox.getValue().equals("=") || opIfElseBox.getValue().equals(">") || 
  opIfElseBox.getValue().equals("<") || opIfElseBox.getValue().equals(">=") || 
  opIfElseBox.getValue().equals("<=") || opIfElseBox.getValue().equals("!=") ){
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
  int groupsize_j;

  for(int i = 0; i < allBlock.size(); i++){
    for(int j = 0; j < allBlock.size(); j++){          
      first_X = allBlock.get(i).getX();
      first_Y = allBlock.get(i).getY();
      second_X = allBlock.get(j).getX();
      second_Y = allBlock.get(j).getY();
      first_W = allBlock.get(i).getW();
      second_W = allBlock.get(j).getW();
      second_H = allBlock.get(j).getH();
      groupsize_j = allBlock.get(j).getSize();
      name_i = allBlock.get(i).getname();
      name_j = allBlock.get(j).getname();      
      if(first_X != second_X || first_Y != second_Y){ // Not same block 
        if(name_j == "ifelse"){
          if(first_X + first_W/2 > second_X + second_W/4 && first_X + first_W/2 <= second_X + second_W/2 && first_Y+5 > second_Y && first_Y+5 < second_Y +(second_H*groupsize_j)){
            fill(255,0,0,120);  
            rect(second_X + second_W/4, second_Y, second_W/4, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(second_X+second_W/4, second_Y+(second_H*groupsize_j), second_X+second_W+second_W/4, second_Y+(second_H*groupsize_j));
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X+second_W/4, second_Y+second_H*groupsize_j);
            }
          }
          else if(first_X + first_W/2 > second_X + second_W/4 && first_X + first_W/2 <= second_X + second_W/2 && first_Y+5 > second_Y + (second_H*groupsize_j) && first_Y+5 < second_Y + second_H + (second_H*groupsize_j)){
            fill(255,0,0,120);  
            rect(second_X + second_W/4, second_Y+(second_H*groupsize_j), second_W/4, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(second_X+second_W/4, second_Y+second_H+(second_H*groupsize_j), second_X+second_W+second_W/4, second_Y+second_H+(second_H*groupsize_j));
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X+second_W/4, second_Y+second_H+(second_H*groupsize_j));
            }
          }
        }
        else if(name_j == "if"){
          if(first_X + first_W/2 > second_X + second_W/4 && first_X + first_W/2 <= second_X + second_W/2 && first_Y+5 > second_Y && first_Y+5 < second_Y + (second_H*groupsize_j)){
            fill(255,0,0,120);  
            rect(second_X + second_W/4, second_Y, second_W/4, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(second_X+second_W/4, second_Y+(second_H*groupsize_j), second_X+second_W+second_W/4, second_Y+(second_H*groupsize_j));
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X+second_W/4, second_Y+second_H*groupsize_j);
            }
          }
        }
        else if(name_j == "repeat"){
           if(first_X + first_W/2 > second_X + second_W/4 && first_X + first_W/2 <= second_X + second_W/2 && first_Y+5 > second_Y && first_Y+5 < second_Y +(second_H*groupsize_j)){
            fill(255,0,0,120);  
            rect(second_X + second_W/4, second_Y, second_W/4, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X+second_W/4, second_Y+second_H*groupsize_j);
            }
          }
        }
        else if (name_j == "move"){
          if(first_X + first_W/2 > second_X + second_W/2  && first_X + first_W/2 <= second_X + second_W && first_Y+5 > second_Y && first_Y+5 < second_Y +second_H){
            fill(255,0,0,120);  
            rect(second_X, second_Y, second_W, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(second_X, second_Y+second_H, second_X+second_W, second_Y+second_H);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              allBlock.get(i).setPosition(second_X, second_Y+second_H);
            }
          }
        }
        else if (name_j == "run"){
          if(first_X + first_W/2 > second_X  && first_X + first_W/2 <= second_X + second_W/4 && first_Y+5 > second_Y && first_Y+5 < second_Y +(second_H*groupsize_j)){
            fill(255,0,0,120);  
            rect(second_X, second_Y, second_W, second_H*groupsize_j);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(second_X, second_Y+second_H*groupsize_j, second_X+second_W, second_Y+second_H*groupsize_j);
            strokeWeight(1);
            if(allBlock.get(i).contains() == false && allBlock.get(j).contains() == false){
              print(groupsize_j);
              allBlock.get(i).setPosition(second_X, second_Y+second_H*groupsize_j);
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
    if((lower_X == upper_X && lower_Y == upper_Y+upper_H) || (lower_X == upper_X+(upper_W/4) && lower_Y == upper_Y+upper_H) || (lower_X == upper_X-(upper_W/2) && lower_Y == upper_Y+upper_H)){
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
     
    if((lower_X == upper_X && lower_Y == upper_Y+upper_H) || (lower_X == upper_X+(upper_W/4) && lower_Y == upper_Y+upper_H) || (lower_X == upper_X-(upper_W/4) && lower_Y == upper_Y+upper_H)){
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }else if((lower_X == upper_X-(upper_W/4)*2 && lower_Y == upper_Y+upper_H)){
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }else if((lower_X == upper_X+(upper_W/2) && lower_Y == upper_Y+upper_H)){ //right
      groupBlock.add(allBlock.get(i));
      dragTogether(allBlock.get(i), groupBlock);//recursive
    }
  }
  return groupBlock;
}

void useBin(){
  int first_x;
  int first_y;
  int first_w;
  int first_h;
  int bin_x = bin.getX();
  int bin_y = bin.getY();
  int bin_w = bin.getW();
  int bin_h = bin.getH();
  for(int i = 0 ; i < allBlock.size(); i++){
    first_x = allBlock.get(i).getX();
    first_y = allBlock.get(i).getY();
    first_w = allBlock.get(i).getW();
    first_h = allBlock.get(i).getH();
    if(first_x + (first_w)/2 > bin_x && first_x + (first_w)/2< (bin_x+bin_w) && first_y + (first_h)/2 > bin_y && first_y + (first_h)/2 < (bin_y+bin_h)){
      fill(255,0,0,120);  
      rect(bin_x,bin_y,bin_w,bin_h);
      noTint();
      if(allBlock.get(i).contains() == false && bin.contains() == false){
        allBlock.remove(i);
      }
    }
    
  }
}
