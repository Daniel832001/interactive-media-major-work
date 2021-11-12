import beads.*;
import java.util.Arrays; 
import controlP5.*;

//changeable parameters

float squareSize;
//determines number of squares at beggining of death/life cycle
int numRows = 10;//max 14
int numCols = 10;//max 16
//volume of audio
float volume = 0.5;
//rate of death/life cycle in seconds
float rate = .5;
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

//non-changeable parameters
Square[] squares = new Square[4];
Square[][] grid = new Square[14][16];

float[] firstCorner = {-150, -150};
float[] secondCorner = {150, 150};
float[] adjustments = {-20, 20};
boolean finished = false;
int timer = 0;
int deathTimer = 0;
boolean first = true;
boolean die = true;
boolean permaDead = false;
int music = 0;

Square currentSquare = new Square(firstCorner, secondCorner, adjustments);
int squareCount = 0;

//interaction points
Button redButton;
Button blueButton;
Button greenButton;
Button yellowButton;
Button purpleButton;
Button orangeButton;
Button pinkButton;
Button blackButton;

Button rotateButton;
Button nextButton;


ControlP5 cp5;


//audio
AudioContext ac;
WavePlayer wp1;
WavePlayer wp2;
WavePlayer wp3;
WavePlayer wp4;
WavePlayer wp5;
WavePlayer wp6;
WavePlayer wp7;
WavePlayer wp8;
WavePlayer wp9;
WavePlayer wp10;
WavePlayer wp11;
WavePlayer wp12;
WavePlayer wp13;
WavePlayer wp14;
Gain g;
Glide gainGlide;
Glide frequencyGlide1;
Glide frequencyGlide2;
Glide frequencyGlide3;
Glide frequencyGlide4;
Glide frequencyGlide5;
Glide frequencyGlide6;
Glide frequencyGlide7;
Glide frequencyGlide8;
Glide frequencyGlide9;
Glide frequencyGlide10;
Glide frequencyGlide11;
Glide frequencyGlide12;
Glide frequencyGlide13;
Glide frequencyGlide14;




void setup() {
  frameRate(60);
  size(900, 785);
  cp5 = new ControlP5(this);
  addButtonColours();
  addButtons();  
  background(white);
  noStroke();
  ac = new AudioContext();
  gainGlide = new Glide(ac, volume, 50);
  frequencyGlide1 = new Glide(ac, 0);
  frequencyGlide2 = new Glide(ac, 0);
  frequencyGlide3 = new Glide(ac, 0);
  frequencyGlide4 = new Glide(ac, 0);
  frequencyGlide5 = new Glide(ac, 0);
  frequencyGlide6 = new Glide(ac, 0);
  frequencyGlide7 = new Glide(ac, 0);
  frequencyGlide8 = new Glide(ac, 0);
  frequencyGlide9 = new Glide(ac, 0);
  frequencyGlide10 = new Glide(ac, 0);
  frequencyGlide11 = new Glide(ac, 0);
  frequencyGlide12 = new Glide(ac, 0);
  frequencyGlide13 = new Glide(ac, 0);
  frequencyGlide14 = new Glide(ac, 0);
  
  wp1 = new WavePlayer(ac,frequencyGlide1,Buffer.SINE);
  wp2 = new WavePlayer(ac,frequencyGlide2,Buffer.SINE);
  wp3 = new WavePlayer(ac,frequencyGlide3,Buffer.SINE);
  wp4 = new WavePlayer(ac,frequencyGlide4,Buffer.SINE);
  wp5 = new WavePlayer(ac,frequencyGlide5,Buffer.SINE);
  wp6 = new WavePlayer(ac,frequencyGlide6,Buffer.SINE);
  wp7 = new WavePlayer(ac,frequencyGlide7,Buffer.SINE);
  wp8 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  wp9 = new WavePlayer(ac,frequencyGlide7,Buffer.SINE);
  wp10 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  wp11 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  wp12 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  wp13 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  wp14 = new WavePlayer(ac,frequencyGlide8,Buffer.SINE);
  
  g = new Gain(ac,1,gainGlide);
  g.addInput(wp1);
  g.addInput(wp2);
  g.addInput(wp3);
  g.addInput(wp4);
  g.addInput(wp5);
  g.addInput(wp6);
  g.addInput(wp7);
  g.addInput(wp8);
  g.addInput(wp9);
  g.addInput(wp10);
  g.addInput(wp11);
  g.addInput(wp12);
  g.addInput(wp13);
  g.addInput(wp14);
  
  ac.out.addInput(g);
  ac.start();
}

void draw() {

  if (!finished) {

    selectionMenu(); 
    addButtonColours();
  } else {

    //background(white);
    grid();
    timer += 1;
    
    if ((timer > frameRate*5 || !first)){
        timer = 0;
        gameOfLife();
        first = false;
    
    }
    
    if (permaDead){
      
      if (music < 900 && music >= 0){
        stroke(150,150,150);
        strokeWeight(3);
        line(music,0,music,900);
        frequencyGlide1.setValue(getFrequency(0));
        frequencyGlide2.setValue(getFrequency(1));
        frequencyGlide3.setValue(getFrequency(2));
        frequencyGlide4.setValue(getFrequency(3));
        frequencyGlide5.setValue(getFrequency(4));
        frequencyGlide6.setValue(getFrequency(5));
        frequencyGlide7.setValue(getFrequency(6));
        frequencyGlide8.setValue(getFrequency(7));
        frequencyGlide9.setValue(getFrequency(8));
        frequencyGlide10.setValue(getFrequency(9));
        frequencyGlide11.setValue(getFrequency(10));
        frequencyGlide12.setValue(getFrequency(11));
        frequencyGlide13.setValue(getFrequency(12));
        frequencyGlide14.setValue(getFrequency(13));
        music++;
      }else{
        music = -1;
        frequencyGlide1.setValue(0);
        frequencyGlide2.setValue(0);
        frequencyGlide3.setValue(0);
        frequencyGlide4.setValue(0);
        frequencyGlide5.setValue(0);
        frequencyGlide6.setValue(0);
        frequencyGlide7.setValue(0);
        frequencyGlide8.setValue(0);
        frequencyGlide9.setValue(0);
        frequencyGlide10.setValue(0);
        frequencyGlide11.setValue(0);
        frequencyGlide12.setValue(0);
        frequencyGlide13.setValue(0);
        frequencyGlide14.setValue(0);
      }
    }
  }
}

float getFrequency(int row){
  
  //range of frequency/return value 100-800
  int col = getCol();
  println("current Row: "+row,"current Col: "+col);
  int currentSquarePos = music - col*55;
  //grid[row][col];
  if (grid[row][col].getAlive()){
    float percent = currentSquarePos/55;
    println("currentSquarePos: "+currentSquarePos);
    float frequency = 700*percent;
    println("frequency: "+frequency);
    if (grid[row][col].getRotate() == 0 || grid[row][col].getRotate() == 180){
      return frequency + 100;
    }
    if (grid[row][col].getRotate() == 90 || grid[row][col].getRotate() == 270){
      return 800 - frequency;
    }
  }
  
  
  return 0;
}

int getCol(){
  int col = music/55;
  if (col > 15){
    return 15;
  }
  return music/55;
}

void gameOfLife(){
  
  
  deathTimer += 1;
  if (deathTimer > frameRate*rate){
     die = false;
  }
  if (deathTimer >frameRate*rate*2){
    die = true;
    deathTimer = 0;
  }
  
  if (deathTimer == 0){
    permaDead = true;    
  }
  
  
  
  if (die){
    //death
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
          if (i < 14-1){
            if(colourMatch(grid[i][j],grid[i+1][j],"S")){
              colourDie = false;
            }
          }
          if (j > 0){
           if(colourMatch(grid[i][j],grid[i][j-1],"W")){
              colourDie = false;
            }
          }
          if (j < 16-1){
            if(colourMatch(grid[i][j],grid[i][j+1],"E")){
              colourDie = false;
            }
          }
          
          if (colourDie){
            grid[i][j].kill();
            permaDead = false;
          }
          
        }
      
      }
    }
  }else{
  
    //birth
    for (int i=0; i<14; i++ ) {
      for (int j=0; j<16; j++ ) {
        
        
        if (grid[i][j].getAlive()){
          
          
          //double triangle birth
          if (i > 0){
            if(triangleBirth(grid[i][j],grid[i-1][j],"E")){
              if (j < 16-1){
                if (!grid[i][j+1].getAlive()){
                  grid[i][j+1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i][j+1].setRandColour();
                  grid[i][j+1].setRandRotation();
                  permaDead = false;
                }
                if (!grid[i-1][j+1].getAlive()){
                  grid[i-1][j+1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j+1].setRandColour();
                  grid[i-1][j+1].setRandRotation();
                  permaDead = false;
                }
              }
            }else if(triangleBirth(grid[i][j],grid[i-1][j],"W")){
              if (j > 0){
                if (!grid[i][j-1].getAlive()){
                  grid[i][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i][j-1].setRandColour();
                  grid[i][j-1].setRandRotation();
                  permaDead = false;
                }
                if (!grid[i-1][j-1].getAlive()){
                  grid[i-1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j-1].setRandColour();
                  grid[i-1][j-1].setRandRotation();
                  permaDead = false;
                }
              }
              
            }
          }
          if (j > 0){
           if(triangleBirth(grid[i][j],grid[i][j-1],"S")){
             if (i < 14-1){
                if (!grid[i+1][j].getAlive()){
                  grid[i+1][j] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i][j-1]}));
                  grid[i+1][j].setRandColour();
                  grid[i+1][j].setRandRotation();
                  permaDead = false;
                }
                if (!grid[i+1][j-1].getAlive()){
                  grid[i+1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i][j-1]}));
                  grid[i+1][j-1].setRandColour();
                  grid[i+1][j-1].setRandRotation();
                  permaDead = false;
                }
              }
           }else if(triangleBirth(grid[i][j],grid[i][j-1],"N")){
             if (i > 0){
                if (!grid[i-1][j].getAlive()){
                  grid[i-1][j] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i][j-1]}));
                  grid[i-1][j].setRandColour();
                  grid[i-1][j].setRandRotation();
                  permaDead = false;
                }
                if (!grid[i-1][j-1].getAlive()){
                  grid[i-1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i][j-1]}));
                  grid[i-1][j-1].setRandColour();
                  grid[i-1][j-1].setRandRotation();
                  permaDead = false;
                }
              }
             
           }
          }   
          
          
          
          
          
          
          
          //diagonal line birth
          if (i > 0){
            if (j < 16-1){
              if(diagonalBirth(grid[i][j],grid[i-1][j],"ES")){              
                if (!grid[i][j+1].getAlive()){
                  grid[i][j+1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i][j+1].setRandColour();
                  grid[i][j+1].setRandRotation();
                  permaDead = false;
                }
              }
            
              if(diagonalBirth(grid[i][j],grid[i-1][j],"EN")){
                if (!grid[i-1][j+1].getAlive()){
                  grid[i-1][j+1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j+1].setRandColour();
                  grid[i-1][j+1].setRandRotation();
                  permaDead = false;
                }
              }
            }
            if (j > 0){
              if(diagonalBirth(grid[i][j],grid[i-1][j],"WS")){                
                if (!grid[i][j-1].getAlive()){                  
                  grid[i][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i][j-1].setRandColour();
                  grid[i][j-1].setRandRotation();
                  permaDead = false;
                }
              }
            
              if(diagonalBirth(grid[i][j],grid[i-1][j],"WN")){
                if (!grid[i-1][j-1].getAlive()){
                  grid[i-1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j-1].setRandColour();
                  grid[i-1][j-1].setRandRotation();
                  permaDead = false;
                }             
              } 
            }
          }
          if (j > 0){
            if (i < 14-1){
             if(diagonalBirth(grid[i][j],grid[i][j-1],"SE")){             
                if (!grid[i+1][j].getAlive()){
                  grid[i+1][j] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i+1][j].setRandColour();
                  grid[i+1][j].setRandRotation();
                  permaDead = false;
                }
             }
           
             if(diagonalBirth(grid[i][j],grid[i][j-1],"SW")){
                if (!grid[i+1][j-1].getAlive()){
                  grid[i+1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i+1][j-1].setRandColour();
                  grid[i+1][j-1].setRandRotation();
                  permaDead = false;
                }
             }
           }
           if (i > 0){
             if(diagonalBirth(grid[i][j],grid[i][j-1],"NE")){             
                if (!grid[i-1][j].getAlive()){
                  grid[i-1][j] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j].setRandColour();
                  grid[i-1][j].setRandRotation();
                  permaDead = false;
                }
             }
             if(diagonalBirth(grid[i][j],grid[i][j-1],"NW")){
                if (!grid[i-1][j-1].getAlive()){
                  grid[i-1][j-1] = new Square(getParentSquare(new Square[] {grid[i][j],grid[i-1][j]}));
                  grid[i-1][j-1].setRandColour();
                  grid[i-1][j-1].setRandRotation();
                  permaDead = false;
                }
             } 
           }
          }   
          
          
        }
        
        
      }
    }
    
  }
  
}
//returns a random square from 1 of 2 parents, determines what colour scheme the newly created square will use
Square getParentSquare(Square[] parents){  
  int rand = int(random(2));
  return parents[rand];
}
//if firstSqaure and backSquare create a diagonal line from their matching colours that would extend in direction "direction" return true, else return false
boolean diagonalBirth(Square firstSquare, Square backSquare, String direction){
  
  color firstColour = color(0,0,0);
  color backColour = color(0,0,1);
  switch(direction){
    case "EN":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if(firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        } 
      }
      break;
    case "ES":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
         if(firstSquare.getRotate() == 90){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 270){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
    case "WN":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
         if(firstSquare.getRotate() == 90){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 270){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
    case "WS":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if(firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        } 
      }
      break;
    case "NW":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
         if(firstSquare.getRotate() == 270){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 90){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }        
      }
      break;
    case "NE":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if(firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        } 
      }
      break;
    case "SW":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if(firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        } 
      }
      break;
    case "SE":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
         if(firstSquare.getRotate() == 270){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 90){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }        
      }
      break;
  }
  
  if (firstColour == backColour){
    return true;
  }
  
  return false;
}

//if the orientation of 2 colour matching squares (firstSquare & backSquare where direction is the direciton a new square woulkd be created/aka the direction of the flat/non-diagonal side of the double trianle)
//creates a single coloured triangle made up of 2 triangles(1 from each square) return true, else return false
boolean triangleBirth(Square firstSquare, Square backSquare, String direction){
  
  color firstColour = color(0,0,0);
  color backColour = color(0,0,1);
  switch(direction){
    case "N":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
        if (firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 90){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
    case "S":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if (firstSquare.getRotate() == 270){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
    case "E":
      if ((firstSquare.getRotate() == 90 || firstSquare.getRotate() == 270) && (backSquare.getRotate() == 0 || backSquare.getRotate() == 180)){
        if (firstSquare.getRotate() == 90){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 180){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
    case "W":
      if ((firstSquare.getRotate() == 0 || firstSquare.getRotate() == 180) && (backSquare.getRotate() == 90 || backSquare.getRotate() == 270)){
        if (firstSquare.getRotate() == 0){
          firstColour = firstSquare.getPrimary();
        }else{
          firstColour = firstSquare.getSecondary();
        }
        
        if (backSquare.getRotate() == 270){
          backColour = backSquare.getPrimary();
        }else{
          backColour = backSquare.getSecondary();
        }
      }
      break;
  }
  if (firstColour == backColour){
    return true;
  }
  
  return false;
}




//returns true if "mainSquare" shares a colour with "otherSquare" in the direction "direction", otehrwise return false
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



//draws the first screen with all buttons, colour schemes and preview of the square
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

//sets up the grid by placing a "numRow"*"numCol" grid in the centre of the screen of randomly assigned squares using the chosen colour schemes
void setUpGrid() {
  int topGap = (14-numRows)/2;
  int sideGap =  (16-numCols)/2;
  for (int i=0; i<14; i++ ) {
    for (int j=0; j<16; j++ ) {
      if (i >= topGap && i < numRows+topGap && j >= sideGap && j < numCols+sideGap){
        grid[i][j] = new Square(getSquare());
        grid[i][j].setRandRotation();
        grid[i][j].setRandColour();     
      }else{
       grid[i][j] = new Square(getSquare()); 
       grid[i][j].kill();
      }
    }
  }
}
//returns a random square from the list of 4 squares the user selected a colour scheme for
Square getSquare() {
  int rand = int(random(4));
  return squares[rand];
}

//displays the entire screen grid based on the squares saved in the grid 2d array, including dead (ie completely white) squares
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


//randomly assigns the parameter square the 3 color paremters where each colour has to be used but where they are assigned (priamry triangle, line and secondary triangle) randomly
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

//returns 1 of the 3 parameter colours based on the int paremete given
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


//BUTTON METHODS
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

//resets the canvas for the grid page
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

//adds colours below each coulour scheme button
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

//adds all buttons
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
