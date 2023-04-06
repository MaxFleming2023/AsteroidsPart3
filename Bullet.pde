class Bullet extends Floater {
  double speed;
  public Bullet(Spaceship theShip) {
    myColor = 255;
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    speed = 20;
    //myYspeed = 6;
    myPointDirection = theShip.getPointDirection();
    accelerate(.6);
  }
  public void show() {
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  public float getX() {
    return myCenterX;
  }
  public float getY() {
    return myCenterY;
  }
  public void move(){
    //myCenterX += myXspeed*Math.cos(myPointDirection);
    //myCenterY += myYspeed*Math.sin(myPointDirection);
    myCenterX+= speed * myXspeed;
    myCenterY += speed * myYspeed;
  }
  //public boolean removeBullet() {
  // return false; 
  //}
}
