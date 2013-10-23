import traer.physics.*;
import java.util.List;

class Star{
  float x;
  float y;
  float periodLength = 10.0;
 
  float timeOfBirth;
  
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.timeOfBirth = frameCount;
  }
  
  public void draw(){
    float time = (frameCount-this.timeOfBirth) % periodLength;
    
  fill(235, 206,1);
  ellipse(x, y, this.calculateSize(time), this.calculateSize(time));
  }
  
  public float calculateSize(float time){
  return -abs(time) + 5;
   }
}    
