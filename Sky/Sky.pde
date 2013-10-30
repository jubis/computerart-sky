List<Star> stars = new ArrayList<Star>();
List<FallingStar> fallingStars = new ArrayList<FallingStar>();
List<Firework> fireworks = new ArrayList<Firework>();

static final int STARS = 1;
static final int FIREWORKS = 2;
static final int RAINBOW = 1;
static final int WHITE = 2;
static final int SMALL = 3;

int state = 0;

boolean screenvisible = false;


//Attribuutteja gradienttia varten 
int Y_AXIS = 1;
color c1, c2;
PImage bg;
PImage gradient;
PImage instructions;

Controller controller = new Controller();
float time = round(random(50, 100));

float infotime;

Audio audio;

public void setup() {
  size(1000, 700); 

  gradient = loadImage("gradient.png");
  bg = loadImage("studio4.png");
  instructions = loadImage("ohjeet.png");
  
  frameRate(20);
  
  for(int i=0; i<5; i++){ 
    stars.add(new Star(random(width), random(height/1.5))); 
  }
  
  audio = new Audio();
  audio.start();
}

public void draw() {

  image(gradient, 0, 0);

  audio.draw();
  
  drawLaura();
  
  for(Firework fw : fireworks) {
    fw.draw();
  }
  image(bg, 0, -100);
  
  fill(145);
  ellipse(width-45, height-40, 34, 34);
  
  textSize(28);
  fill(255);
  text("?", width-50, height-30); 
  
  drawInfo();
  
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
  if(stars.size() == 0) {
    createStars(true);
  }
  int randStarIndex = round(random(stars.size()-0.5));
  //Index Out Of Bound exception 
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
      infotime = frameCount;
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
    float w = frameCount - infotime;
    w = 10*w;
    int sizelimit = 250;
    w = min(sizelimit, w);
    //x=250 ja y=280
    rect(width/2-w, height/2-w, 2*w, 2*w, 7);
    /*if(w==sizelimit){
      image(instructions, width/2-w, height/2-w);
    }*/
  }
  else{
  }
}

