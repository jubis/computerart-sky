  class FallingStar{
  float x;
  float y;
  float origSizeY = 5;
  float origSizeX = 60;
  float angle = 0;
  
  PImage star;    
  float Xspeed = 0;
  float Yspeed = 0;
  float gravityX = 0;
  float gravityY = 0;
  float timeOfBirth;
  boolean alive = true;
  
  public FallingStar(float x, float y){
      this.x = x;
      this.y = y;
      this.angle = random(0, TWO_PI);
      this.gravityX = cos(angle);
      this.gravityY = sin(angle);
      //this.star = loadImage("tahti.png");
      this.timeOfBirth = frameCount;
    }

   public void draw(){
      this.y = this.y + this.Yspeed;
      this.x = this.x + this.Xspeed;
      this.Yspeed = this.Yspeed + this.gravityY;
      this.Xspeed = this.Xspeed + this.gravityX;
     
      float sizeX = this.origSizeX - this.Yspeed;
      float sizeY = this.origSizeY - this.Yspeed/3;
      if(sizeY<0){
        sizeY=0;
        this.alive = false;
       }
      if(sizeX<0){
       sizeX=0;
       }
      translate(-this.x, -this.y);
      rotate(90);
    //  image(star, 0, 0, sizeX, sizeY);
      rotate(-90);
      translate(this.x, this.y);
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
    
    public boolean isAlive(){
      return this.alive;
    }
   }    
