  class FallingStar{
  float x;
  float y;
  
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
      float rand = random(0, TWO_PI);
      this.gravityX = 2*cos(rand);
      this.gravityY = 2*sin(rand);
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
        fill(158, 240, 254, 255-20*(this.points.size()-i));
        ellipse(points.get(i)[0], points.get(i)[1], 5, 5);
      }
      if(this.x < 0 || this.x > width || this.y < 0 || this.y > height){
        this.isAlive = false;
       }
     }
         
    public float getTimeOfBirth(){
       return this.timeOfBirth;
    }
    
    public boolean isAlive(){
      return this.isAlive;
    }
   }    
