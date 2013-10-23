List<Star> stars = new ArrayList<Star>();
 public float length_of_period = 10.0;
 public float time = 0;
 public float y;
 public float pointX = time % length_of_period;
 public float pointY;

void setup(){
  size(640,480);
  frameRate(20);
  for(int i=0; i<10; i++){
  stars.add(new Star(random(width), random(height/1.5)));  
  }
}

void draw(){
   background(0);
    for(int i=0; i<stars.size(); i++){
      stars.get(i).draw();
   }
}
   
public void graph(){
  pointY = -abs(time) + 5; 
 }
