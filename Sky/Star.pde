import traer.physics.*;
import java.util.List;

class Star{
  float x;
  float y;
  float timeOfBirth;
  float maxSize;
  float lengthOfPeriod;
  float twinklingSpeed;
  
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.timeOfBirth = frameCount;
    this.maxSize = 5;
    this.twinklingSpeed = random(0.2, 0.5);
    this.lengthOfPeriod = 2 * (maxSize/this.twinklingSpeed);
    }
  
  public void draw(){
    float time = (frameCount-this.timeOfBirth) % this.lengthOfPeriod;
    fill(235,206,1);
    ellipse(x, y, this.calculateSize(time), this.calculateSize(time));
    }
  
  public float calculateSize(float time){
    return -this.twinklingSpeed*abs(time) + 5;
    }
    
    //Testausta varten
   public float getTwinklingSpeed(){
     return this.twinklingSpeed;
    }
}    
