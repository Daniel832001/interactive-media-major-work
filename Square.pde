class Square{
 
  private Triangle firstTriangle;
  private Triangle secondTriangle;
  private Triangle topLineTriangle;
  private Triangle bottomLineTriangle;
  private float rotation;
  private float[] firstCorner = new float[2];
  private float[] secondCorner = new float[2];
  private float[] thirdCorner = new float[2];
  private float[] fourthCorner = new float[2];
  private color primary;
  private color secondary;
  private color stroke;
  
  
  public Square(float[] corner1, float[] corner2, float[] adjustments, float rotate){    
    rotation = rotate;
    firstCorner = corner1;
    secondCorner = corner2;
    firstTriangle = new Triangle(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[0],  corner2[0]+adjustments[0],corner1[1]+adjustments[0]);
    secondTriangle = new Triangle(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[1],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[1]);
    topLineTriangle = new Triangle(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
    bottomLineTriangle = new Triangle(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[0],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[0]);
    primary = color(0,0,0);
    secondary = color(0,0,0);
    stroke = color(0,0,0);
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
  public void setPrimary(color colour){
    primary = colour;
  }
  public void setSecondary(color colour){
    secondary = colour;
  }
  public void setOutline(color colour){
    stroke = colour;
  }
  
  public void setRotate(float rotate){
    rotation += rotate;
    if (rotation == 360){
      rotation = 0;
    }
  }
  public float getRotate(){
    return rotation;
  }
  
  public void setSize(float[] corner1, float[] corner2, float[] adjustments){
    firstTriangle.setSize(corner1[0]+adjustments[0],corner1[1]+adjustments[0], corner1[0]+adjustments[0],corner2[1]+adjustments[0],  corner2[0]+adjustments[0],corner1[1]+adjustments[0]);
    secondTriangle.setSize(corner2[0]+adjustments[1],corner2[1]+adjustments[1], corner1[0]+adjustments[1],corner2[1]+adjustments[1],  corner2[0]+adjustments[1],corner1[1]+adjustments[1]);
    topLineTriangle.setSize(corner2[0],corner2[1], corner1[0],corner2[1],  corner2[0],corner1[1]);
    bottomLineTriangle.setSize(corner2[0],corner2[1], corner1[0],corner2[1],  corner2[0],corner1[1]);
  }
  
  
  
}
