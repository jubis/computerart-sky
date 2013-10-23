import traer.physics.*;
import java.util.List;
 
class Star{
  float x;
  float y;
  float periodLength = 10.0;
  float pointX = frameCount % periodLength;
  float timeOfBirth;
 
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.timeOfBirth = frameCount;
  }
 
  public void draw(){
  fill(235, 206,1);
  ellipse(x, y, frameCount-this.timeOfBirth, frameCount-this.timeOfBirth);
  }
 
  public float getPointY(){
  return -abs(this.pointX) + 5;
   }
}
