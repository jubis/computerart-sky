class FallingStar{
  float x;
  float y;
  float origSize = 50;
  
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
     
      float size = this.origSize - this.Xspeed;
      if(size<0){
        size=0;
        this.alive = false;
       }
      image(star, x, y, size, size);
      println(size);
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
    
    public boolean isAlive(){
      return this.alive;
    }
   }    
