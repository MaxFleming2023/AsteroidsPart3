class Asteroid extends Floater {
  private double rotSpeed;
  boolean bigAs;
  public Asteroid() {
    rotSpeed = Math.random()*5;
    myColor = 158;
    corners = 6;
    bigAs = true;
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
    myXspeed = (int)(Math.random()*5)-2.5;
    myYspeed = (int)(Math.random()*5)-2.5;
    myPointDirection = (int)(Math.random()*360);
    xCorners = new int [] {(int)(Math.random()*10)-20, (int)(Math.random()*10)+17, (int)(Math.random()*10)+22, (int)(Math.random()*10)+14, (int)(Math.random()*10)-20, (int)(Math.random()*10)-16};
    yCorners = new int [] {(int)(Math.random()*10)-18, (int)(Math.random()*10)-17, (int)(Math.random()*10), (int)(Math.random()*10)+19, (int)(Math.random()*10)+18, (int)(Math.random()*10)};
  }
  public void move() {
    turn(rotSpeed);
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    if (myCenterX >width) {
      myCenterX = 0;
    } else if (myCenterX<0) {
      myCenterX = width;
    }
    if (myCenterY >height) {
      myCenterY = 0;
    } else if (myCenterY < 0) {
      myCenterY = height;
    }
  }
   public float getX() {
   return myCenterX;
  }
  public float getY() {
   return myCenterY; 
  }
}
