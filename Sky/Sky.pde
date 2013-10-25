List<Star> stars = new ArrayList<Star>();
List<FallingStar> fallingStars = new ArrayList<FallingStar>();

static final int STARS = 1;
static final int FIREWORKS = 2;
int state = 0;
Controller controller = new Controller();
float time = round(random(50, 100));

public void setup() {
  size(800, 600);  
  background(0);
  frameRate(20);
  
  for(int i=0; i<5; i++){ 
  stars.add(new Star(random(width), random(height/1.5))); 
  }
}

public void draw() {
  background(0);
  drawLaura();
}

public void drawLaura(){
    for(int i=0; i<stars.size(); i++){
      stars.get(i).draw();
     }
    createFallingStars();
    
    
    for(int j=0; j<fallingStars.size(); j++){
    fallingStars.get(j).draw();
      if(fallingStars.get(j).isAlive() == false){
      fallingStars.remove(j);
      }
     }
    }  
   
public void createFallingStars(){

    int randStarIndex = round(random(stars.size()-0.5));
    Star randStar = stars.get(randStarIndex);
     println("framecount: " + frameCount + ", time: " + time);
    if(frameCount == time){
      println("toimii");
    fallingStars.add(new FallingStar(randStar.getX(), randStar.getY()));
    time = round(frameCount + random(50, 100));
  }
}

public void keyPressed(){
  controller.keyPressed();
}
 
public void mouseClicked(){
  switch(state){
  case STARS:
    //luo uusi tähti ja aseta listan perälle
    stars.add(new Star(mouseX, mouseY));
    println("state STARS");
    break;
  case FIREWORKS:
    //luo uusi ilotulite ja aseta listan perälle
    println("state FIREWORKS");
    break;
  default:
    println("default");
    break;
  }
}
