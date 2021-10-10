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
ArrayList<Command> allBlock;
ArrayList<Command> Root;
ArrayList<Command> groupBlock;

Root start;
Node temp;

//ArrayList<Variable> variables;
Variable variable;
ArrayList<Variable> variables;
int var_y;

Command pointer;

//chceckconnectblock
Command connecter, pointertemp;
Command father, pointerdistemp, parenttemp;



int my,mx,oldx,oldy;
boolean released = true, blockCheck, blockdisCheck;
ArrayList<Command> nodeTree, connectBlockTemp, childTemp, childdiscon, childTemp2, childpointerdisTemp, connectBlockTemp1;
int ytemp, ydistemp, disconytemp;


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
  
  variables = new ArrayList<Variable>();
  var_y = 490;
   
}

void traverse(Command c){ //do command of start's child
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

Command nodeinClass(Node n){ //get class of that node
  for ( int i = 0 ; i < allBlock.size() ; i++ ){
     if ( allBlock.get(i).getNode() == n ){
       return allBlock.get(i); 
     }
  }
  return null;
}

Command getparent(Command c,Command cm){
  for (int i = 0 ; i < c.getchildSize() ; i++){
    if ( c.getvalChild(i).equals("move") || c.getvalChild(i).equals("rotate") || c.getvalChild(i).equals("setX") || c.getvalChild(i).equals("setY") ){
      //println("Move by " + c.getnodeChild(i).getvalChild(0));
      if ( c.getnodeChild(i) == cm.getNode() ) {
        if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            return nodeinClass(temp);
            //break;
        }
        //println("Found Laew Ja : " + c.getVal());
        return nodeinClass(c.getNode());
        //break;
      }
    }
    if ( c.getvalChild(i).equals("repeat") ){
      int number = Integer.parseInt(c.getnodeChild(i).getvalChild(0)); //n of repeat
      println("Repeat by " + number );
      if ( c.getnodeChild(i) == cm.getNode() ) {
        if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            return nodeinClass(temp);
            //break;
        }
        //println("Fond Laew Ja : " + c.getVal());
        return nodeinClass(c.getNode());
        //break;
      }
      getparent(c.getnodeChild(i),cm);
    }
    if ( c.getvalChild(i).equals("if") ){
      if ( c.getnodeChild(i).getvalChild(0).equals("TRUE")){
        println("If Condition = TRUE ");
        if ( c.getnodeChild(i) == cm.getNode() ) {
          if ( c.getVal().equals("ifTRUE") || c.getVal().equals("ifFALSE")){
            println("Fond Laew Ja : " + temp.getVal());
            return nodeinClass(temp);
            //break;
          }
          println("Fond Laew Ja : " + c.getVal());
          return nodeinClass(c.getNode());
          //break;
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
            return nodeinClass(temp);
            //break;
          }
          println("Fond Laew Ja : " + c.getVal());
          return nodeinClass(c.getNode());
          //break;
        }
        getparent(c.getnodeChild(i).getnodeChild(1),cm); 
        getparent(c.getnodeChild(i).getnodeChild(2),cm);
      }
    }
    return null;
}

void traversemove(Command c, ArrayList<Command> nodeTree){ //find child (node)
  for ( int i = 0 ; i < c.getchildSize() ; i++ ){
    //println("traversemove " + c.getvalChild(i));
    if ( c.getvalChild(i).equals("move") || c.getvalChild(i).equals("rotate") || c.getvalChild(i).equals("setX") || c.getvalChild(i).equals("setY")){
      nodeTree.add(c.getnodeChild(i));
    }
    if ( c.getvalChild(i).equals("repeat") ){
      nodeTree.add(c.getnodeChild(i));
      traversemove(c.getnodeChild(i),nodeTree);
    }
    if ( c.getvalChild(i).equals("if") ){
      nodeTree.add(c.getnodeChild(i));
      traversemove(c.getnodeChild(i),nodeTree);
    }
    if ( c.getvalChild(i).equals("ifelse") ){
      nodeTree.add(c.getnodeChild(i));
      traversemove(c.getnodeChild(i).getnodeChild(1),nodeTree);
      traversemove(c.getnodeChild(i).getnodeChild(2),nodeTree);
    }
  }
}

void mouseClicked(){
  if(startButton.pressed()){
    for(int i = 0 ; i < allBlock.size(); i++){
      if(allBlock.get(i) == start){
        traverse(allBlock.get(i));
      }
    }
  }
  
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

void mouseReleased(){
  pointer = null;
  released = true;
  //println("from mouseReleased: released = " + released);
}

void mousePressed(){
  
  released = false;
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
    }else{
      println("please insert value");
    }
  }
  
  //rotateButton----------------------------------------------------------------------------------------------------------
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
  
  //setXButton-----------------------------------------------------------------------------------------------------------------------------------
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
  
  //setYButton------------------------------------------------------------------------------------------------------------------------------------
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
  
  for ( int i = 0 ; i < allBlock.size() ; i++ ){ //if mouse in block, set pointer to that block
    if(mouseX >= allBlock.get(i).getX() && mouseX <= allBlock.get(i).getX() + allBlock.get(i).getW() && mouseY >= allBlock.get(i).getY() && mouseY <= allBlock.get(i).getY() + allBlock.get(i).getH()){
      pointer = allBlock.get(i);
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
  
  if (mousePressed){
    if ( pointer != null ){ //if there is a pointer then drag it
      nodeTree = new ArrayList<Command>();
      traversemove(pointer,nodeTree);
      pointer.drag();      
      if (nodeTree != null){
        for ( int i = 0 ; i < nodeTree.size() ; i++ ){     
           nodeinClass((Node)nodeTree.get(i)).drag();
           nodeinClass((Node)nodeTree.get(i)).display();  
        }
      }
    }
  }
  for ( int k = 0 ; k < allBlock.size() ; k++ ){ //all block to display
    allBlock.get(k).display();
  }
  
  for(int i = 0 ; i < variables.size() ; i++){
    //println(variables);
    variables.get(i).display();
  }

  checkconnectBlock();
  connectBlock();
  checkdisconnectBlock();
  disconnectBlock();
  useBin();
  showCoordinates();
  
}

void checkconnectBlock(){ //first = pointer
  childTemp = new ArrayList<Command>();
  if (mousePressed){
    for ( int i = 0 ; i < allBlock.size() ; i++ ){
      if ( pointer != null && allBlock.get(i) != pointer){
        if ( pointer.contains() == true && allBlock.get(i).contains() == true ){
          //println(allBlock.get(i).getname());
          if ( allBlock.get(i).getname().equals("repeat") || allBlock.get(i).getname().equals("if")){
            pointertemp = pointer;
            connecter = allBlock.get(i);
            ytemp = 0;
            traversemove(connecter,childTemp);//add child of 
            if ( childTemp != null ){
              for ( int j = 0 ; j < childTemp.size() ; j++ ){
                
                ytemp += 30;
              }
            }
            fill(255,0,0,120);  
            rect(allBlock.get(i).getX()+allBlock.get(i).getW()/4, allBlock.get(i).getY(), allBlock.get(i).getW()-allBlock.get(i).getW()/4, allBlock.get(i).getH()+ytemp);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(allBlock.get(i).getX()+allBlock.get(i).getW()/4, allBlock.get(i).getY()+allBlock.get(i).getH()+ytemp, allBlock.get(i).getX()+allBlock.get(i).getW()+allBlock.get(i).getW()/4, allBlock.get(i).getY()+allBlock.get(i).getH()+ytemp);
            strokeWeight(1);
            //println("from connectBlock: released = " + released);
            blockCheck = true;
            //println("ccB " + ytemp);
          }
          
          else if ( allBlock.get(i).getname().equals("run")){
            pointertemp = pointer;
            connecter = allBlock.get(i);
            ytemp = 0;
            traversemove(connecter,childTemp);
            if ( childTemp != null ){
              for ( int j = 0 ; j < childTemp.size() ; j++ ){
                ytemp += 30;
              }
            }
            fill(255,0,0,120);  
            rect(allBlock.get(i).getX(), allBlock.get(i).getY(), allBlock.get(i).getW(), allBlock.get(i).getH()+ytemp);
            noTint();
            stroke(0,255,0);
            strokeWeight(4);
            line(allBlock.get(i).getX(), allBlock.get(i).getY()+allBlock.get(i).getH()+ytemp, allBlock.get(i).getX()+allBlock.get(i).getW(), allBlock.get(i).getY()+allBlock.get(i).getH()+ytemp);
            strokeWeight(1);
            //println("from connectBlock: released = " + released);
            blockCheck = true;
            //println("ccB " + ytemp);
          }
        }
      }
    }
  }
}

void checkdisconnectBlock(){
  if (mousePressed){
    childdiscon = new ArrayList<Command>();
    for ( int i = 0 ; i < allBlock.size() ; i++ ){
      if ( pointer != null && allBlock.get(i) != null && allBlock.get(i) != pointer && getparent(allBlock.get(i),pointer) != null && pointer.contains() == true){
        //println("getparent = " + getparent(allBlock.get(i),pointer)); 
        father = getparent(allBlock.get(i),pointer);
        pointerdistemp = pointer;
        //traversemove(distemp,childTemp1);
        //println("childTemp1 " + childTemp1);
        //if ( childTemp1 != null ){
        //  for ( int j = 0 ; j < childTemp1.size() ; j++ ){
        //    ydistemp += 30;
        //  }
        //}
        blockdisCheck = true;
        break;
      }        
    }
  }
}

void connectBlock(){
  if ( blockCheck == true && pointertemp.inBlock() == true && connecter.inBlock() == true ) {
    if (released == true){ //released == true
    println("allBlocktemp = " + connecter);
      if ( connecter.getname().equals("repeat") ){
        //println("hahaha " + allBlocktemp.getname());
        //for ( int i = 1 ; i < allBlocktemp.getchildSize() ; i++ ){
        //  //println(allBlocktemp.getnodeChild(i));
        //  childytemp += allBlocktemp.getnodeChild(i).getY();
        //}
        //println("childytemp = " + ytemp);
        int cbtempx = (connecter.getX()+connecter.getW()/4);
        int cbtempy = (connecter.getY()+connecter.getH()+ytemp) + 30;
        connectBlockTemp = new ArrayList<Command>();
        //connectBlockTemp.add(pointertemp);
        traversemove(pointertemp,connectBlockTemp);
        pointertemp.setPosition(cbtempx,cbtempy-30);
        
        connectBlockTemp1 = new ArrayList<Command>();
        traversemove(connecter,connectBlockTemp1);
        
        int cbtemp = 0;
        for ( int i = 0 ; i < connectBlockTemp.size() ; i++ ){
          for ( int j = 0 ; j < connectBlockTemp1.size() ; j++){
            Command classtemp1 = nodeinClass((Node) connectBlockTemp.get(i));
            if ( connectBlockTemp.get(i) == connectBlockTemp1.get(j) ){
               cbtemp += 1;
            }
            
            if ( getparent(pointertemp,classtemp1) != null && cbtemp > connectBlockTemp.size()+1){
              parenttemp = getparent(pointertemp,classtemp1);
              classtemp1.setPosition(parenttemp.getX()+30,cbtempy);
            } else {
               classtemp1.setPosition(cbtempx,cbtempy);
            }
            classtemp1.display();
            //println(i + " " + connectBlockTemp.get(i));
            //println(cbtempy);
            cbtempy += 30;
          }
        }
        
        //pointertemp.setPosition(allBlocktemp.getX()+allBlocktemp.getW()/4, allBlocktemp.getY()+allBlocktemp.getH()+ytemp);
        
        connecter.addCommand(pointertemp.getNode());
        blockCheck = false;
        pointertemp = null;
        connecter = null;
        ytemp = 0;
      }
      
      else if ( connecter.getname().equals("run") ){
        pointertemp.setPosition(connecter.getX(), connecter.getY()+connecter.getH()+ytemp);
        connecter.addCommand(pointertemp.getNode());
        blockCheck = false;
        pointertemp = null;
        connecter = null;
        ytemp = 0;
      }
    }
  }
}

void disconnectBlock(){
  int index = 0;
  if ( pointerdistemp != null && father != null ){
    if ( blockdisCheck == true && father.inBlock() == false ) {
      if ( released == true) {
         if ( father.getname().equals("repeat")  ){
          childdiscon = new ArrayList<Command>();                        //child of parent
          traversemove(father,childdiscon);
          for ( int i = 0 ; i < childdiscon.size() ; i++ ){
            if ((Node) childdiscon.get(i) == pointerdistemp.getNode() ){
              index = i;
              println("index = " + index );
              println(childdiscon.get(i).getVal());
            }
          }
          father.removeCommand(pointerdistemp.getNode());
          childTemp2 = new ArrayList<Command>();                        //child of parent but start from index after remove 
          for ( int i = index+1 ; i < childdiscon.size() ; i++ ){
            childTemp2.add(childdiscon.get(i));
            //println(childTemp1.get(i));
          }
          //println("childtemp1later = " + childTemp1);
          //for ( int j = 0 ; j < childTemp1.size() ; j++ ){
          //  //ydistemp += 30;
          //}
          childpointerdisTemp = new ArrayList<Command>();
          traversemove(pointerdistemp,childpointerdisTemp);
          int disconytemp = childpointerdisTemp.size()*30;
          for ( int i = 0 ; i < childTemp2.size() ; i++){
            for ( int j = 0 ; j < childpointerdisTemp.size() ; j++ ){
              Command classtemp = nodeinClass((Node) childTemp2.get(i));
              Command classtemp1 = childpointerdisTemp.get(j);
              if ( classtemp != classtemp1 ){
                classtemp.setPosition(classtemp.getX(), classtemp.getY()-30-disconytemp);
              //classtemp.display();
              }
            }
          }
          
          blockdisCheck = false;
          pointerdistemp = null;
          father = null;
          ydistemp = 0;
        }
      }
    }
  }
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
