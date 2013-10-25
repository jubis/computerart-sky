
List<Star> stars = new ArrayList<Star>();

static final int STARS = 1;
static final int FIREWORKS = 2;
int state = 0;

//Attribuutteja gradienttia varten 
int Y_AXIS = 1;
color c1, c2;

Controller controller = new Controller();

public void setup() {
  size(1000, 800); 
  
  //Taustagradienttien värien määritys tumman ja vaaleamman sinisiksi
  c1 = color(0, 0, 25);
  c2 = color(0, 0, 120);

  frameRate(20);
  for(int i=0; i<10; i++){
  stars.add(new Star(random(width), random(height/1.5)));  
  }
}

public void draw() {

  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  
  drawLaura();
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
