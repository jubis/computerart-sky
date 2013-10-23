import traer.physics.*;
import java.util.List;

class Star{
  float x;
  float y;
  float a = 0.0;
  float s = 0.0;
  PImage star;
  
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.star = loadImage("star.png");
  }
  
  public void draw(){
    fill(235, 206,1);
    
if (frameCount == 100){
  ellipse(x, y, 10, 10);
}
  if (frameCount == 200){
    ellipse(x, y, 15, 15);
    
    }
  }
}

 
    
