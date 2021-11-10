class Triangle{
 
  private float x1;
  private float y1;
  private float x2;
  private float y2;
  private float x3;
  private float y3;
  
  public Triangle(float x1, float y1, float x2, float y2, float x3, float y3){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }
  
  public float getx1(){
    return x1;
  }
  public float gety1(){
    return y1;
  }
  public float getx2(){
    return x2;
  }
  public float gety2(){
    return y2;
  }
  public float getx3(){
    return x3;
  }
  public float gety3(){
    return y3;
  }
  
  public void setSize(float x1, float y1, float x2, float y2, float x3, float y3){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }
}
