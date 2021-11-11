import beads.*;
import java.util.Arrays; 
import controlP5.*;

//changeable parameters
float squareSize;
int numRows = 10;//max 14
int numCols = 10;//max 16
//buttons won't change names to reflect different colour but everything else will
color red = color(255, 0, 0);
color blue = color(0, 0, 255);
color green = color(0, 255, 0);
color yellow = color(255, 255, 0);
color purple = color(155, 0, 255);
color orange = color(255, 100, 0);
color pink = color(255, 0, 255);
color black = color(0, 0, 0);
color white = color(255, 255, 255);
color grey = color(100, 100, 100);
String colourMode = "primary";//options "primary","secondary","outline"

//non-changeable parameters
Square[] squares = new Square[4];
Square[][] grid = new Square[14][16];

float[] firstCorner = {-150, -150};
float[] secondCorner = {150, 150};
float[] adjustments = {-20, 20};
boolean finished = false;
int timer = 0;
boolean first2 = true;

Square currentSquare = new Square(firstCorner, secondCorner, adjustments);
int squareCount = 0;

Button redButton;
Button blueButton;
Button greenButton;
Button yellowButton;
Button purpleButton;
Button orangeButton;
Button pinkButton;
Button blackButton;

Button primaryButton;
Button secondaryButton;
Button outlineButton;

Button rotateButton;
Button nextButton;


ControlP5 cp5;



void setup() {
  frameRate(60);
  size(900, 785);
  cp5 = new ControlP5(this);
  addButtonColours();
  addButtons();  
  background(white);
  noStroke();
}

void draw() {

  if (!finished) {

    selectionMenu(); 
    addButtonColours();
  } else {

    //background(white);
    grid();
    timer += 1;
    
    if (first2 && timer > 60*5){
    
        gameOfLife();
        first2 = false;
    
    }
  }
}


void gameOfLife(){
 
  for (int i=0; i<14; i++ ) {
    for (int j=0; j<16; j++ ) {
      boolean colourDie = true;
      //println("i: "+i,"j: "+j);
      if (grid[i][j].getAlive()){
        if (i > 0){
          if(colourMatch(grid[i][j],grid[i-1][j],"N")){
            colourDie = false;
          }
        }
        if (i < numRows-1){
          if(colourMatch(grid[i][j],grid[i+1][j],"S")){
            colourDie = false;
          }
        }
        if (j > 0){
         if(colourMatch(grid[i][j],grid[i][j-1],"W")){
            colourDie = false;
          }
        }
        if (j < numCols-1){
          if(colourMatch(grid[i][j],grid[i][j+1],"E")){
            colourDie = false;
          }
        }
        
        if (colourDie){
          grid[i][j].kill();
        }
        
      }
    
    }
  }
  
}


boolean colourMatch(Square mainSquare, Square otherSquare, String direction){
  
  color mainColour = color(0,0,0);
  color otherColour = color(0,0,1);
  switch(direction){
    case "N":
      
      if (mainSquare.getRotate() == 0 || mainSquare.getRotate() == 90){
        mainColour = mainSquare.getPrimary();
      }else{
        mainColour = mainSquare.getSecondary();
      }
      
      if (otherSquare.getRotate() == 180 || otherSquare.getRotate() == 270){
        otherColour = otherSquare.getPrimary();
      }else{
        otherColour = otherSquare.getSecondary();
      }   
      break;
    case "S":
      
      if (mainSquare.getRotate() == 0 || mainSquare.getRotate() == 90){
        mainColour = mainSquare.getSecondary();
      }else{
        mainColour = mainSquare.getPrimary();
      }
      
      if (otherSquare.getRotate() == 180 || otherSquare.getRotate() == 270){
        otherColour = otherSquare.getSecondary();
      }else{
        otherColour = otherSquare.getPrimary();
      }   
      break;
    case "W":
      
      if (mainSquare.getRotate() == 0 || mainSquare.getRotate() == 270){
        mainColour = mainSquare.getPrimary();
      }else{
        mainColour = mainSquare.getSecondary();
      }
      
      if (otherSquare.getRotate() == 90 || otherSquare.getRotate() == 180){
        otherColour = otherSquare.getPrimary();
      }else{
        otherColour = otherSquare.getSecondary();
      } 
      break;
    case "E":
      
      if (mainSquare.getRotate() == 0 || mainSquare.getRotate() == 270){
        mainColour = mainSquare.getSecondary();
      }else{
        mainColour = mainSquare.getPrimary();
      }
      
      if (otherSquare.getRotate() == 90 || otherSquare.getRotate() == 180){
        otherColour = otherSquare.getSecondary();
      }else{
        otherColour = otherSquare.getPrimary();
      }     
      break;  
  }
  //println("Direction: "+direction,"main: "+mainColour,"other: "+otherColour);
  if (mainColour == otherColour){
    return true;
  }
  
  
  return false; 
}




void selectionMenu() {
  //inner line - top half
  pushMatrix();
  translate(450, 200);
  rotate(radians(currentSquare.getRotate()));
  fill(currentSquare.getStroke());
  triangle(currentSquare.getTopLineTriangle().getx1(), currentSquare.getTopLineTriangle().gety1(), 
    currentSquare.getTopLineTriangle().getx2(), currentSquare.getTopLineTriangle().gety2(), 
    currentSquare.getTopLineTriangle().getx3(), currentSquare.getTopLineTriangle().gety3());
  popMatrix();
  //inner line - bottom half
  pushMatrix();
  translate(450, 200);
  rotate(radians(currentSquare.getRotate()));
  fill(currentSquare.getStroke());
  triangle(currentSquare.getBottomLineTriangle().getx1(), currentSquare.getBottomLineTriangle().gety1(), 
    currentSquare.getBottomLineTriangle().getx2(), currentSquare.getBottomLineTriangle().gety2(), 
    currentSquare.getBottomLineTriangle().getx3(), currentSquare.getBottomLineTriangle().gety3());
  popMatrix();


  pushMatrix();
  translate(450, 200);
  rotate(radians(currentSquare.getRotate()));    
  fill(currentSquare.getPrimary());
  triangle(currentSquare.getFirstTriangle().getx1(), currentSquare.getFirstTriangle().gety1(), 
    currentSquare.getFirstTriangle().getx2(), currentSquare.getFirstTriangle().gety2(), 
    currentSquare.getFirstTriangle().getx3(), currentSquare.getFirstTriangle().gety3());
  popMatrix();

  pushMatrix();
  translate(450, 200);
  rotate(radians(currentSquare.getRotate()));
  fill(currentSquare.getSecondary());
  triangle(currentSquare.getSecondTriangle().getx1(), currentSquare.getSecondTriangle().gety1(), 
    currentSquare.getSecondTriangle().getx2(), currentSquare.getSecondTriangle().gety2(), 
    currentSquare.getSecondTriangle().getx3(), currentSquare.getSecondTriangle().gety3());
  popMatrix();
}

void setUpGrid() {
  int topGap = (14-numRows)/2;
  int sideGap =  (16-numCols)/2;
  for (int i=0; i<14; i++ ) {
    for (int j=0; j<16; j++ ) {
      if (i >= topGap && i < numRows+topGap && j >= sideGap && j < numCols+sideGap){
        grid[i][j] = new Square(getSquare());
        grid[i][j].setRandRotation();
        colourAssignment( grid[i][j].getPrimary(), grid[i][j].getSecondary(), grid[i][j].getStroke(), grid[i][j]);      
      }else{
       grid[i][j] = new Square(getSquare()); 
       grid[i][j].kill();
      }
    }
  }
}

Square getSquare() {
  int rand = int(random(4));
  return squares[rand];
}


void grid() {
  //float leftSideStart = (900-numCols*50)/2;
  float leftSideStart = 25;
  //float topSideStart = (800-numRows*50)/2;
  float topSideStart = 25;
  float seperator = 56.5;
  for (int i=0; i<14; i++ ) {
    for (int j=0; j<16; j++ ) {
      
      noStroke();
      strokeWeight(0);

      //inner line - top half
      pushMatrix();
      translate(leftSideStart+seperator*j, topSideStart+seperator*i);
      rotate(radians(grid[i][j].getRotate()));
      fill(grid[i][j].getStroke());
      triangle(grid[i][j].getTopLineTriangle().getx1(), grid[i][j].getTopLineTriangle().gety1(), 
        grid[i][j].getTopLineTriangle().getx2(), grid[i][j].getTopLineTriangle().gety2(), 
        grid[i][j].getTopLineTriangle().getx3(), grid[i][j].getTopLineTriangle().gety3());
      popMatrix();
      //inner line - bottom half
      pushMatrix();
      translate(leftSideStart+seperator*j, topSideStart+seperator*i);
      rotate(radians(grid[i][j].getRotate()));
      fill(grid[i][j].getStroke());
      triangle(grid[i][j].getBottomLineTriangle().getx1(), grid[i][j].getBottomLineTriangle().gety1(), 
        grid[i][j].getBottomLineTriangle().getx2(), grid[i][j].getBottomLineTriangle().gety2(), 
        grid[i][j].getBottomLineTriangle().getx3(), grid[i][j].getBottomLineTriangle().gety3());
      popMatrix();


      pushMatrix();
      translate(leftSideStart+seperator*j, topSideStart+seperator*i);
      rotate(radians(grid[i][j].getRotate()));    
      fill(grid[i][j].getPrimary());
      triangle(grid[i][j].getFirstTriangle().getx1(), grid[i][j].getFirstTriangle().gety1(), 
        grid[i][j].getFirstTriangle().getx2(), grid[i][j].getFirstTriangle().gety2(), 
        grid[i][j].getFirstTriangle().getx3(), grid[i][j].getFirstTriangle().gety3());
      popMatrix();

      pushMatrix();
      translate(leftSideStart+seperator*j, topSideStart+seperator*i);
      rotate(radians(grid[i][j].getRotate()));
      fill(grid[i][j].getSecondary());
      triangle(grid[i][j].getSecondTriangle().getx1(), grid[i][j].getSecondTriangle().gety1(), 
        grid[i][j].getSecondTriangle().getx2(), grid[i][j].getSecondTriangle().gety2(), 
        grid[i][j].getSecondTriangle().getx3(), grid[i][j].getSecondTriangle().gety3());
      popMatrix();
    }
  }
}



void colourAssignment(color color1, color color2, color color3, Square square) {
  int[] rands = {-1, -1, -1};
  rands[0] = int(random(3));
  square.setPrimary(getColour(color1, color2, color3, rands[0]));
  rands[1] = int(random(3));
  while (rands[0] == rands[1]) {
    rands[1] = int(random(3));
  }
  square.setSecondary(getColour(color1, color2, color3, rands[1]));
  rands[2] = int(random(3));
  while (rands[0] == rands[2] || rands[1] == rands[2]) {
    rands[2] = int(random(3));
  }
  square.setOutline(getColour(color1, color2, color3, rands[2]));
}

color getColour(color color1, color color2, color color3, int rand) {

  if (rand == 0) {
    return color1;
  } else if (rand == 1) {
    return color2;
  } else if (rand == 2) {
    return color3;
  }
  return color(246, 123, 79);
}


//BUTTONS
void colour_scheme_1() {
  colourAssignment(blue, red, green, currentSquare);
}
void colour_scheme_2() { 
  colourAssignment(orange, purple, pink, currentSquare);
}
void colour_scheme_3() {
  colourAssignment(yellow, orange, red, currentSquare);
}
void colour_scheme_4() {
  colourAssignment(green, yellow, pink, currentSquare);
}
void colour_scheme_5() {
  colourAssignment(black, purple, blue, currentSquare);
}
void colour_scheme_6() {
  colourAssignment(red, purple, yellow, currentSquare);
}
void colour_scheme_7() {
  colourAssignment(orange, blue, black, currentSquare);
}
void colour_scheme_8() {
  colourAssignment(pink, black, green, currentSquare);
}
void primary() {
  colourMode = "primary";
}
void secondary() { 
  colourMode = "secondary";
}
void outline() { 
  colourMode = "outline";
}
void rotate() {
  currentSquare.setRotate(90);
}
void next() {
  squares[squareCount] = currentSquare;
  squareCount ++;
  if (squareCount == 4) {
    squareCount = 0;
    finished = true;
    reset();
  }
  if (squares[squareCount] == null) {
    currentSquare = new Square(firstCorner, secondCorner, adjustments);
  } else {
    currentSquare = squares[squareCount];
  }
}


void reset() {  
  background(white);
  redButton.setVisible(false);
  blueButton.setVisible(false);
  greenButton.setVisible(false);
  yellowButton.setVisible(false);
  purpleButton.setVisible(false);
  orangeButton.setVisible(false);
  pinkButton.setVisible(false);
  blackButton.setVisible(false);

  rotateButton.setVisible(false);
  nextButton.setVisible(false);

  float[] firstCorner = {-25, -25};
  float[] secondCorner = {25, 25};
  //float[] firstCorner = {-100,-100};
  //float[] secondCorner = {100,100};
  float[] adjustments = {-3.3, 3.3};
  for (int i=0; i<squares.length; i++ ) {
    squares[i].setSize(firstCorner, secondCorner, adjustments);
  }
  setUpGrid();
}

void addButtonColours() {

  //colour scheme 1
  fill(blue);
  rect(100, 450, 100, 30);
  fill(red);
  rect(100, 480, 100, 30);
  fill(green);
  rect(100, 510, 100, 30);

  //colour scheme 2
  fill(orange);
  rect(300, 450, 100, 30);
  fill(purple);
  rect(300, 480, 100, 30);
  fill(pink);
  rect(300, 510, 100, 30);

  //colour scheme 3
  fill(yellow);
  rect(500, 450, 100, 30);
  fill(orange);
  rect(500, 480, 100, 30);
  fill(red);
  rect(500, 510, 100, 30);

  //colour scheme 4
  fill(green);
  rect(700, 450, 100, 30);
  fill(yellow);
  rect(700, 480, 100, 30);
  fill(pink);
  rect(700, 510, 100, 30);

  //colour scheme 5
  fill(black);
  rect(100, 650, 100, 30);
  fill(purple);
  rect(100, 680, 100, 30);
  fill(blue);
  rect(100, 710, 100, 30);

  //colour scheme 6
  fill(red);
  rect(300, 650, 100, 30);
  fill(purple);
  rect(300, 680, 100, 30);
  fill(yellow);
  rect(300, 710, 100, 30);

  //colour scheme 7
  fill(orange);
  rect(500, 650, 100, 30);
  fill(blue);
  rect(500, 680, 100, 30);
  fill(black);
  rect(500, 710, 100, 30);

  //colour scheme 8
  fill(pink);
  rect(700, 650, 100, 30);
  fill(black);
  rect(700, 680, 100, 30);
  fill(green);
  rect(700, 710, 100, 30);
}


void addButtons() {
  redButton = cp5.addButton("colour_scheme_1")
    .setPosition(100, 430)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  blueButton = cp5.addButton("colour_scheme_2")
    .setPosition(300, 430)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  greenButton = cp5.addButton("colour_scheme_3")
    .setPosition(500, 430)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  yellowButton = cp5.addButton("colour_scheme_4")
    .setPosition(700, 430)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  purpleButton = cp5.addButton("colour_scheme_5")
    .setPosition(100, 630)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  orangeButton = cp5.addButton("colour_scheme_6")
    .setPosition(300, 630)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  pinkButton = cp5.addButton("colour_scheme_7")
    .setPosition(500, 630)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);
  blackButton = cp5.addButton("colour_scheme_8")
    .setPosition(700, 630)
    .setSize(100, 20)
    .setLabelVisible(true)
    .setColorForeground(grey);

  rotateButton = cp5.addButton("rotate")
    .setPosition(700, 100)
    .setSize(100, 20);
  nextButton = cp5.addButton("next")
    .setPosition(700, 200)
    .setSize(100, 20);
}
