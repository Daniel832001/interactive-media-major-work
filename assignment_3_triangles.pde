import beads.*;
import java.util.Arrays; 
import controlP5.*;

//changeable parameters
float squareSize;
int numRows = 1;
int numCols = 4;
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
Square[] squares = new Square[numRows*numCols];

float[] firstCorner = {-150, -150};
float[] secondCorner = {150, 150};
//float[] firstCorner = {-25,-25};
//float[] secondCorner = {25,25};
//float[] adjustments = {-3.25, 3.25};
float[] adjustments = {-10,10};
boolean finished = false;

Square currentSquare = new Square(firstCorner, secondCorner, adjustments, 0);
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
  size(900, 800);
  cp5 = new ControlP5(this);
  addButtons();
  background(white);  
  //addColours();
}

void draw() {

  if (!finished) {

    //stroke(currentSquare.getStroke());  
    strokeWeight(0);
    
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
    
    
  } else {

    strokeWeight(5);
    for (int i=0; i<squares.length; i++ ) {
      stroke(squares[i].getStroke()); 
      fill(squares[i].getPrimary());  

      pushMatrix();
      translate(450+100*i, 200+100*i);
      rotate(radians(squares[i].getRotate()));
      triangle(squares[i].getFirstTriangle().getx1(), squares[i].getFirstTriangle().gety1(), 
        squares[i].getFirstTriangle().getx2(), squares[i].getFirstTriangle().gety2(), 
        squares[i].getFirstTriangle().getx3(), squares[i].getFirstTriangle().gety3());
      popMatrix();

      pushMatrix();
      translate(450+100*i, 200+100*i);
      rotate(radians(squares[i].getRotate()));
      fill(squares[i].getSecondary());
      triangle(squares[i].getSecondTriangle().getx1(), squares[i].getSecondTriangle().gety1(), 
        squares[i].getSecondTriangle().getx2(), squares[i].getSecondTriangle().gety2(), 
        squares[i].getSecondTriangle().getx3(), squares[i].getSecondTriangle().gety3());
      popMatrix();
    }
  }
}






void red() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(red);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(red);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(red);
  }
}
void blue() { 
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(blue);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(blue);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(blue);
  }
}
void green() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(green);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(green);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(green);
  }
}
void yellow() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(yellow);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(yellow);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(yellow);
  }
}
void purple() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(purple);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(purple);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(purple);
  }
}
void orange() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(orange);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(orange);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(orange);
  }
}
void pink() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(pink);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(pink);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(pink);
  }
}
void black() {
  if (colourMode.equals("primary")) {
    currentSquare.setPrimary(black);
  } else if (colourMode.equals("secondary")) {
    currentSquare.setSecondary(black);
  } else if (colourMode.equals("outline")) {
    currentSquare.setOutline(black);
  }
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
  if (squareCount == numRows*numCols) {
    squareCount = 0;
    finished = true;
    reset();
  }
  if (squares[squareCount] == null) {
    currentSquare = new Square(firstCorner, secondCorner, adjustments, 0);
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

  primaryButton.setVisible(false);
  secondaryButton.setVisible(false);
  outlineButton.setVisible(false);

  rotateButton.setVisible(false);
  nextButton.setVisible(false);
  for (int i=0; i<squares.length; i++ ) {
    float[] firstCorner = {-25,-25};
    float[] secondCorner = {25,25};
    float[] adjustments = {-2,2};
    squares[i].setSize(firstCorner,secondCorner,adjustments);
  }
}








void addButtons() {
  redButton = cp5.addButton("red")
    .setPosition(100, 450)
    .setSize(100, 100)
    .setColorBackground(red)
    .setLabelVisible(false)
    .setColorForeground(grey);
  blueButton = cp5.addButton("blue")
    .setPosition(300, 450)
    .setSize(100, 100)
    .setColorBackground(blue)
    .setLabelVisible(false)
    .setColorForeground(grey);
  greenButton = cp5.addButton("green")
    .setPosition(500, 450)
    .setSize(100, 100)
    .setColorBackground(green)
    .setLabelVisible(false)
    .setColorForeground(grey);
  yellowButton = cp5.addButton("yellow")
    .setPosition(700, 450)
    .setSize(100, 100)
    .setColorBackground(yellow)
    .setLabelVisible(false)
    .setColorForeground(grey);
  purpleButton = cp5.addButton("purple")
    .setPosition(100, 650)
    .setSize(100, 100)
    .setColorBackground(purple)
    .setLabelVisible(false)
    .setColorForeground(grey);
  orangeButton = cp5.addButton("orange")
    .setPosition(300, 650)
    .setSize(100, 100)
    .setColorBackground(orange)
    .setLabelVisible(false)
    .setColorForeground(grey);
  pinkButton = cp5.addButton("pink")
    .setPosition(500, 650)
    .setSize(100, 100)
    .setColorBackground(pink)
    .setLabelVisible(false)
    .setColorForeground(grey);
  blackButton = cp5.addButton("black")
    .setPosition(700, 650)
    .setSize(100, 100)
    .setColorBackground(black)
    .setLabelVisible(false)
    .setColorForeground(grey);

  primaryButton = cp5.addButton("primary")
    .setPosition(100, 100)
    .setSize(100, 20);
  secondaryButton = cp5.addButton("secondary")
    .setPosition(100, 200)
    .setSize(100, 20);
  outlineButton = cp5.addButton("outline")
    .setPosition(100, 300)
    .setSize(100, 20);

  rotateButton = cp5.addButton("rotate")
    .setPosition(700, 100)
    .setSize(100, 20);
  nextButton = cp5.addButton("next")
    .setPosition(700, 200)
    .setSize(100, 20);
}
