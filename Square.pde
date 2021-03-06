class Square{
 
  private Triangle firstTriangle;
  private Triangle secondTriangle;
  private Triangle topLineTriangle;
  private Triangle bottomLineTriangle;
  private int rotation;
  private float[] firstCorner = new float[2];
  private float[] secondCorner = new float[2];
  private color primary;
  private color secondary;
  private color stroke;
  private boolean alive;
  private boolean giveBirth;
  
  
  public Square(float[] corner1, float[] corner2, float[] adjustments){    
    rotation = 0;
    firstCorner = corner1;
    secondCorner = corner2;
    firstTriangle = new Triangle(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[0],  corner2[0]+adjustments[0],corner1[1]+adjustments[0]);
    secondTriangle = new Triangle(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[1],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[1]);
    topLineTriangle = new Triangle(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
    bottomLineTriangle = new Triangle(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
    primary = color(0,0,0);
    secondary = color(0,0,0);
    stroke = color(0,0,0);
    alive = true;
    giveBirth = false;
  }
  
  public Square(Square square){    
    rotation = square.getRotate();
    firstCorner = square.getFirstCorner();
    secondCorner = square.getSecondCorner();
    firstTriangle = square.getFirstTriangle();
    secondTriangle = square.getSecondTriangle();
    topLineTriangle = square.getTopLineTriangle();
    bottomLineTriangle = square.getBottomLineTriangle();
    primary = square.getPrimary();
    secondary = square.getSecondary();
    stroke = square.getStroke();    
    alive = square.getAlive();
    giveBirth = square.getBirth();
  }
  
  public float[] getFirstCorner(){
    return firstCorner;
  }
  public float[] getSecondCorner(){
    return secondCorner;
  }
  public Triangle getFirstTriangle(){
    return firstTriangle;
  }
  public Triangle getSecondTriangle(){
    return secondTriangle;
  }
  public Triangle getTopLineTriangle(){
    return topLineTriangle;
  }
  public Triangle getBottomLineTriangle(){
    return bottomLineTriangle;
  }
  public color getPrimary(){
    return primary;
  }
  public color getSecondary(){
    return secondary;
  }
  public color getStroke(){
    return stroke;
  }
  public boolean getAlive(){
    return alive;
  }
  public boolean getBirth(){
    return giveBirth;
  }
  public int getRotate(){
    return rotation;
  }
  public void setPrimary(color colour){
    primary = colour;
  }
  public void setSecondary(color colour){
    secondary = colour;
  }
  public void setOutline(color colour){
    stroke = colour;
  }
  public void setAlive(boolean bool){
    alive = bool;
  }
  public void setBirth(boolean bool){
    giveBirth = bool;
  }  
  public void setRotate(float rotate){
    rotation += rotate;
    if (rotation == 360){
      rotation = 0;
    }
  }  
  public void setRandRotation(){
    int rand = int(random(4));
    rotation = (rand)*90;
  }
  public void setRandColour(){
    int[] rands = {-1, -1, -1};
    rands[0] = int(random(3));
    color tempPrimary = getColour(primary, secondary, stroke, rands[0]);
    rands[1] = int(random(3));
    while (rands[0] == rands[1]) {
      rands[1] = int(random(3));
    }
    color tempSecondary = getColour(primary, secondary, stroke, rands[1]);
    rands[2] = int(random(3));
    while (rands[0] == rands[2] || rands[1] == rands[2]) {
      rands[2] = int(random(3));
    }
    color tempStroke = getColour(primary, secondary, stroke, rands[2]);
    primary = tempPrimary;
    secondary = tempSecondary;
    stroke = tempStroke;
  }
  private color getColour(color color1, color color2, color color3, int rand) {

    if (rand == 0) {
      return color1;
    } else if (rand == 1) {
      return color2;
    } else if (rand == 2) {
      return color3;
    }
    return color(246, 123, 79);
  }
  public void setSize(float[] corner1, float[] corner2, float[] adjustments){
    firstTriangle.setSize(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[0],  corner2[0]+adjustments[0],corner1[1]+adjustments[0]);
    secondTriangle.setSize(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[1],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[1]);
    topLineTriangle.setSize(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
    bottomLineTriangle.setSize(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
  }
  
  public void kill(){
    setAlive(false);
    setPrimary(color(255,255,255));
    setSecondary(color(255,255,255));
    setOutline(color(255,255,255));
  }
  
  
}
