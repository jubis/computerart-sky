import java.util.List;

class Star{
  float x;
  float y;
  float timeOfBirth;
  float maxSize;
  float lengthOfPeriod;
  float twinklingSpeed;
  float gravity;
  float speed = 0;
  
  public Star(float x, float y){
    this.x = x;
    this.y = y;
    this.timeOfBirth = frameCount;
    this.maxSize = random(3, 6);
    this.twinklingSpeed = random(0.1, 0.3);
    this.lengthOfPeriod = 2 * (this.maxSize/this.twinklingSpeed);
    this.gravity = 0;
  }
  
  public void draw(){
    float time = (frameCount-this.timeOfBirth) % this.lengthOfPeriod;
    fill(216,245,254);
    ellipse(x, y, this.calculateSize(time), this.calculateSize(time));
    if(gravity != 0){
      this.fall();
    }
  }
  
  public float calculateSize(float time){
    return -this.twinklingSpeed*abs(time) + this.maxSize;
  }
    
  public float getX(){
     return this.x;
  }
   
  public float getY(){
     return this.y;
  }  
     
   public void fall(){
     this.y += this.speed;
     this.speed += gravity;
   }
   
   public void setGravity(float gravity){
   this.gravity = gravity;
   }
 }    
