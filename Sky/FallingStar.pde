class FallingStar{
  float x;
  float y;
  float origSizeY = 5;
  float origSizeX = 60;
  
  PImage star;    
  float Xspeed = 0;
  float Yspeed = 0;
  float gravity = 0.5;
  float timeOfBirth;
  boolean alive = true;
  
  public FallingStar(float x, float y){
      this.x = x;
      this.y = y;
      this.star = loadImage("fallingStar.png");
      this.timeOfBirth = frameCount;
    }

   public void draw(){
      this.y = this.y + this.Yspeed;
      this.x = this.x + this.Xspeed;
      this.Yspeed = this.Yspeed + this.gravity;
      this.Xspeed = this.Xspeed + 3*this.gravity;
     
      float sizeX = this.origSizeX - this.Yspeed;
      float sizeY = this.origSizeY - this.Yspeed/3;
      if(sizeY<0){
        sizeY=0;
        this.alive = false;
       }

      if(sizeX<0){
       sizeX=0;
       }
      image(star, x, y, sizeX, sizeY);
   
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
    
    public boolean isAlive(){
      return this.alive;
    }
   }    
