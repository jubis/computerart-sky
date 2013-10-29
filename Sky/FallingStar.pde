  class FallingStar{
  float x;
  float y;
  float origSizeY = 5;
  float origSizeX = 60;
  
  PImage star;    
  float Xspeed = 0;
  float Yspeed = 0;
  float gravityX = 0;
  float gravityY = 0;
  float timeOfBirth;
  boolean isAlive = true;
  List<float[]> points = new ArrayList<float[]>();
  
  public FallingStar(float x, float y){
      this.x = x;
      this.y = y;
      this.gravityX = 0.6;
      this.gravityY = 0.6;
      //this.star = loadImage("tahti.png");
      this.timeOfBirth = frameCount;
    }

   public void draw(){
      this.y = this.y + this.Yspeed;
      this.x = this.x + this.Xspeed;
      this.Yspeed = this.Yspeed + this.gravityY;
      this.Xspeed = this.Xspeed + this.gravityX;
      
      this.points.add(new float[]{x,y});
      for(int i=0; i<this.points.size(); i++){
        noStroke();
        fill(243, 254, 171, 255-10*(this.points.size()-i));
        ellipse(points.get(i)[0], points.get(i)[1], 5, 5);
      }
      
      
      //stroke 0
      //fill(väri, mitä isompi tähti, sitä pienempi arvo-->läpinäkyvä pystö) 4 parametriä
     

      if(this.x < 0 || this.x > width || this.y < 0 || this.y > height){
        this.isAlive = false;
       }
      /*if(sizeX<0){
       sizeX=0;
       }*/
       
     /* translate(-this.x, -this.y);
      rotate(90);
      image(star, 0, 0, sizeX, sizeY);
      rotate(-90);
      translate(this.x, this.y);*/
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
    
    public boolean isAlive(){
      return this.isAlive;
    }
   }    
