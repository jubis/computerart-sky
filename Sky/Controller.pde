public class Controller{
 
  public void keyPressed(){
    switch(key) {
      case '1': 
        state = STARS;
        println("Tähdet painettu");
        break;
      case '2':
        state = FIREWORKS;
        println("Ilotulitteet painettu"); 
        break;
      case 'q':
        dropStars();
        break;
      case ' ':
        createFallingStars();
        break;
      case 'o':
        audio.a.stop();
        break;
      case 'p':
        audio.a.play();
        break;
    } 
    

  } 
}
