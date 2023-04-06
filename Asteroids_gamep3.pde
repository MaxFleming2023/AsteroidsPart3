int lives = 0;
int shot = 0;
int broken = 0;
int points = 0;
int numAsteroids = (int)(Math.random()*10);
Star[] nightSky = new Star[200];
ArrayList <Asteroid> cluster = new ArrayList <Asteroid>();
ArrayList <Bullet> shots = new ArrayList <Bullet>();
Spaceship bob = new Spaceship();
public void setup() {
  size(1000, 800);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i] = new Star();
  }
  for (int i = 0; i <= numAsteroids; i++) {
    cluster.add(new Asteroid());
  }
}

public void draw() {

  background(0);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i].show();
  }
  if (cluster.size() == 0) {
    stop();
    textSize(35);
    textAlign(CENTER);
    text("You Win!", width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    text("Final Points : " + points, width/2, height/2+35);
  }
  for (int i = cluster.size() - 1; i >=0; i--) {
    cluster.get(i).move();
    cluster.get(i).show();
    float d = dist(bob.getX(), bob.getY(), cluster.get(i).getX(), cluster.get(i).getY());
    if (d<40) {
      cluster.remove(i);
      lives++;
      broken++;
      points = points+100;
      break;
    }
    for (int e = shots.size()-1; e >=0; e--) {
      float f =  dist(shots.get(e).getX(), shots.get(e).getY(), cluster.get(i).getX(), cluster.get(i).getY());
      if (f<40) {
        broken++;
        points = points+100;
        shot--;
        if (cluster.get(i).bigAs) {
          cluster.add(new MiniAsteroid());
          cluster.add(new MiniAsteroid());
        }
        cluster.remove(i);
        shots.remove(e);
        break;
      }
    }
  }
  for (int i = 0; i < shots.size(); i++) {
    shots.get(i).move();
    shots.get(i).show();
  }
  bob.show();
  bob.move();
  bob.smoothMove();
  textSize(20);
  textAlign(LEFT);
  text("Deaths : " + lives, width-120, height-height+25);
  textSize(20);
  textAlign(LEFT);
  text("Shots : " + shot, width-120, height-height+50);
  textSize(20);
  textAlign(LEFT);
  text("Asteroids Destroyed : " + broken, width-200, height-height+75);
  textSize(20);
  textAlign(RIGHT);
  text("Points : " + points, width-width+120, height-height+25);

  if (lives > 2) {
    stop();
    textSize(35);
    textAlign(CENTER);
    text("You Lose :C", width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    text("Final Points : " + points, width/2, height/2+35);
  }
  if (shot > 149) {
    stop();
    textSize(35);
    textAlign(CENTER);
    text("You Lose, Too Many Shots Fired!", width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    text("Final Points : " + points, width/2, height/2+35);
  }
  if (numAsteroids <= 20) {
    textSize(20);
    textAlign(CENTER);
    text("Easy", width/2, height-height+25);
  } else if (numAsteroids <=30) {
    textSize(20);
    textAlign(CENTER);
    text("Medium", width/2, height-height+25);
  } else if (numAsteroids <=45) {
    textSize(20);
    textAlign(CENTER);
    text("Hard", width/2, height-height+25);
  } else {
    textSize(20);
    textAlign(CENTER);
    text("Galactic Legend.", width/2, height-height+25);
  }
}
public void keyPressed() {
  if (key == 'h') {
    bob.hyperspace();
  }
  if (keyCode == UP) {
    bob.upPress = true;
  }
  if (keyCode == LEFT) {
    bob.leftPress = true;
  }
  if (keyCode == RIGHT) {
    bob.rightPress = true;
  }
  if (keyCode == DOWN) {
    bob.downPress = true;
  }
  if ( keyCode == ' ') {
    shots.add(new Bullet(bob));
    shot++;
    points = points-10;
  }
}
public void keyReleased() {
  if (keyCode == UP) {
    bob.upPress = false;
  }
  if (keyCode == LEFT) {
    bob.leftPress = false;
  }
  if (keyCode == RIGHT) {
    bob.rightPress = false;
  }
  if (keyCode == DOWN) {
    bob.downPress = false;
  }
}
