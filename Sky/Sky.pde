List<Star> stars = new ArrayList<Star>();

public void setup() {
  size(1000, 800);  
  frameRate(20);
  for(int i=0; i<10; i++){
  stars.add(new Star(random(width), random(height/1.5)));  
  }
}

public void draw() {
  println("piirtää");
}

public void drawLaura(){
   for(int i=0; i<stars.size(); i++){
      stars.get(i).draw();
   }
}
