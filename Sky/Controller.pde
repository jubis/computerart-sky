public class Controller{
 
  public void keyPressed(){
    if(key == '1'){
      state = STARS;
      println("Tähdet painettu");
     
    }
    else if(key == '2'){
      state = FIREWORKS;
      println("Ilotulitteet painettu");
    }
    else if(key == 'q'){
      for(Star star:stars){
        star.setGravity(random(0.5, 1));
      }
    }
    else if(key == ' '){
      createFallingStar();
    }
  } 
}
