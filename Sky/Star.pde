import traer.physics.*;
import java.util.List;
<<<<<<< HEAD

=======
 
>>>>>>> f423ee9e95b3a7d1f0622817b07cc2959b77ae17
class Star{
  float x;
  float y;
  float periodLength = 10.0;
<<<<<<< HEAD
 
  float timeOfBirth;
  
=======
  float pointX = frameCount % periodLength;
  float timeOfBirth;
 
>>>>>>> f423ee9e95b3a7d1f0622817b07cc2959b77ae17
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.timeOfBirth = frameCount;
  }
<<<<<<< HEAD
  
  public void draw(){
    float time = (frameCount-this.timeOfBirth) % periodLength;
    
  fill(235, 206,1);
  ellipse(x, y, this.calculateSize(time), this.calculateSize(time));
  }
  
  public float calculateSize(float time){
  return -abs(time) + 5;
   }
}    
=======
 
  public void draw(){
  fill(235, 206,1);
  ellipse(x, y, frameCount-this.timeOfBirth, frameCount-this.timeOfBirth);
  }
 
  public float getPointY(){
  return -abs(this.pointX) + 5;
   }
}
>>>>>>> f423ee9e95b3a7d1f0622817b07cc2959b77ae17
