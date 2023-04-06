class Spaceship extends Floater {
  boolean leftPress, rightPress, upPress, downPress;
  
  public Spaceship() {
    leftPress = rightPress = upPress = downPress = false;
    myColor = 255;
    corners = 4;
    xCorners = new int [] {-8, 16, -8, -2};
    yCorners = new int [] {-8, 0, 8, 0};
  }

  public void hyperspace() {
    myCenterX = (float)Math.random()*width;
    myCenterY = (float)Math.random()*height;
    setXspeed(0);
    setYspeed(0);
  }
  public void setXspeed(double x) {
    myXspeed = x;
  }
  public void setYspeed(double y) {
    myYspeed = y;
  }
  public void setRotationDirection(double r) {
    myPointDirection = r;
  }
  public double getRotationDirection() {
    return myPointDirection;
  }
  public void show () { //Draws the floater at the current position
    fill(myColor);
    stroke(255);
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);
    beginShape();
    for (int nI = 0; nI < corners; nI++) {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }

  public void smoothMove() {
    if (upPress) {
      bob.accelerate(.1);
    }
    if (leftPress) {
      bob.setRotationDirection(bob.getRotationDirection()-7);
    }
    if (rightPress == true) {
      bob.setRotationDirection(bob.getRotationDirection()+7);
    }
    if (downPress == true) {
      bob.accelerate(-.1);
    }
  }
  public float getX() {
   return myCenterX;
  }
  public float getY() {
   return myCenterY; 
  }
  public double getPointDirection(){
   return myPointDirection;
  }
}
