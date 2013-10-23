
static final int STARS = 1;
static final int FIREWORKS = 2;
int state = 0;

Controller controller = new Controller();

public void setup() {
  size(800, 600);  
  background(0);
  frameRate(20);
  for(int i=0; i<10; i++){
  stars.add(new Star(random(width), random(height/1.5)));  
  }
}

public void draw() {
  println("piirtää");
  drawLaura();
}

public void drawLaura(){
   for(int i=0; i<stars.size(); i++){
      stars.get(i).draw();
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
