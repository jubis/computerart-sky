List<Star> stars = new ArrayList<Star>();
List<FallingStar> fallingStars = new ArrayList<FallingStar>();
List<Firework> fireworks = new ArrayList<Firework>();

static final int STARS = 1;
static final int FIREWORKS = 2;
static final int RAINBOW = 1;
static final int WHITE = 2;
static final int SMALL = 3;

int state = 0;
<<<<<<< HEAD

boolean screenvisible = false;

=======
>>>>>>> f03a2e93adb9da6beb60aaa9228e3aaf892f932c
//Attribuutteja gradienttia varten 
int Y_AXIS = 1;
color c1, c2;
PImage img;

Controller controller = new Controller();
float time = round(random(50, 100));

Audio audio;

public void setup() {
  size(1000, 700); 
  
  //Taustagradienttien värien määritys tumman ja vaaleamman sinisiksi
  c1 = color(0, 0, 20);
  c2 = color(0, 0, 105);
  //
  img = loadImage("studio4.png");
  
  frameRate(20);
  
  for(int i=0; i<5; i++){ 
    stars.add(new Star(random(width), random(height/1.5))); 
  }
  
  audio = new Audio();
  audio.start();
}

public void draw() {

  /*setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  drawLaura();*/
  background(0, 0, 80);
  
  
  //setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  
  audio.draw();
  
  
  drawLaura();
  
  for(Firework fw : fireworks) {
    fw.draw();
  }
  image(img, 0, -100);
  
  fill(145);
  ellipse(width-45, height-40, 34, 34);
  
  textSize(28);
  fill(255);
  text("?", width-50, height-30); 
  
  drawInfo();
  
}

//Metodi joka piirtää taivaan taustagradientin
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {
  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float a = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, a);
      stroke(c);
      line(x, i, x+w, i);
    }
  } 
}

public void drawLaura(){
    for(int i=0; i<stars.size(); i++){
      Star star = stars.get(i);
      star.draw();
      if(star.isAlive() == false){
        stars.remove(i);
      }
     }
    if(frameCount == time){
     createFallingStars();
    }
    for(int j=0; j<fallingStars.size(); j++){
    fallingStars.get(j).draw();
      if(fallingStars.get(j).isAlive() == false){
      fallingStars.remove(j);
      println("Death: " + fallingStars.size());
      }
     }
    }  
   
public void createFallingStars(){
  println("falling star");
  
  int randStarIndex = round(random(stars.size()-0.5));
  Star randStar = stars.get(randStarIndex);
  
  fallingStars.add(new FallingStar(randStar.getX(), randStar.getY()));
  println("x-koord: " + randStar.getX() + " y-koord: " + randStar.getY());
  time = round(frameCount + random(50, 100));
}

public void createStars(boolean random) {
  float x = 0;
  float y = 0;
  if(random) {
    x = random(0,width);
    y = random(0,height);
  }
  else {
    x = mouseX;
    y = mouseY;
  }
  stars.add(new Star(x, y));
}

public void createFireworks(boolean random) {
  createFireworks(random, (int)random(1,3));
}
public void createFireworks(boolean random, int type) {
  float x = 0;
  float y = 0;
  if(random) {
    x = random(50,width-50);
    y = random(50,height-100);
  }
  else {
    x = mouseX;
    y = mouseY;
  }
  this.fireworks.add(new Firework(type, (int)x, (int)y));
}

public void dropStars() {
  for(Star star:stars){
        star.setGravity(random(0.5, 1));
      }
}

public void keyPressed(){
  controller.keyPressed();
  //audio.keyPressed();
}
 
public void mouseClicked(){
  if(infoPressed()){
    return;
  }
  switch(state){
  case STARS:
    //luo uusi tähti ja aseta listan perälle
    createStars(false);
    println("state STARS");
    break;
  case FIREWORKS:
    createFireworks(false);
    println("state FIREWORKS");
    break;
  default:
    println("default");
    break;
  }
}

public boolean infoPressed(){
    //Tarkistetaan onko hiiri info-ympyrän päällä
    if(pow((width-45-mouseX),2)+pow((height-40-mouseY),2)<=pow(17, 2)){
      screenvisible=!screenvisible;
      return true;
    }
    else{
      return false;
    }
 }

public void drawInfo(){
  if(screenvisible==true){
    fill(255);
    //1000, 700
    rect(width/2-250, height/2-280, 250*2, 280*2);
  }
  else{
  }
}

