class FallingStar{
  float x;
  float y;
  float origSize = 40;
  
  PImage star;    
  float Xspeed = 0;
  float Yspeed = 0;
  float gravity = 0.1;
  float timeOfBirth;
  
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
     
      float size = this.origSize - 2*this.Xspeed;
      if(size<0){
        size=0;
      }
      image(star, x, y, size, size);
      println(size);
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
   }    
