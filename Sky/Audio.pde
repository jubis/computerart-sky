import pitaru.sonia_v2_9.*; // automcatically added when importing the library from the processing menu.
import java.util.List;

class Audio {
  public Sample a;

  public Audio(){
     //size(1024,500);
     Sonia.start(Sky.this); // Start Sonia engine.
     //a = new Sample("metallica_enter_sandman_official_m_CD_E_LDc384_fmt.wav");
     a = new Sample("ameno_remix_GwIjTef6hLs_fmt43.wav");
     //a.play();
     
     LiveInput.start(1024); // Start LiveInput and return 256 FFT frequency bands.
     
     avgHistory.add(0f);
  }

  void start() {
    a.play();
    a.connectLiveInput(true);
  }
  
  void draw(){
    // getMeterLevel(); // Show meter-level reading for Left/Right channels.
     getSpectrum(); // Show FFT reading
     
     stroke(255,0,0);
     
     /*if(r3 > 0) {
       rect(700,200,24,24);
     }
     if(r2 > 0) {
       rect(500,200,24,24);
     }
     if(r1 > 0) {
       rect(300,200,24,24);
     }*/
     
     r1--;
     r2--;
     r3--;
  }
  
  float r1 = 0;
  float r2 = 0;
  float r3 = 0;
  
  float avg = 100;
  int firstAloneCounter = 0;
  List<Float> avgHistory = new ArrayList<Float>();
  void getSpectrum(){
     strokeWeight(0);
     stroke(0,230,0);
    // populate the spectrum array with FFT values.
     LiveInput.getSpectrum();
     // draw a bar for each of the elements in the spectrum array.
     // Note - the current FFT math is done in Java and is very raw. expect optimized alternative soon
     float avgTemp = 0;
     for ( int i = 0; i < LiveInput.spectrum.length; i++){
        
        float v = LiveInput.spectrum[i]/5;
        if(i > 400) {
          avgTemp += v;
        }
        //line(i, height, i, height - v);
        //rect( i*1, height-LiveInput.spectrum[i]/10, (i+1)*1, LiveInput.spectrum[i]/10 );
        
     }
     avg = avgTemp / LiveInput.spectrum.length;
     
     float historyAvg = 0;
     for(float f : avgHistory) {
       historyAvg += f;
     }
     historyAvg /= avgHistory.size();
     historyAvg = min(historyAvg, 10);
     
     stroke(255);
     //line(0,height-historyAvg*50,1024,height-historyAvg*50);
     //rect(0,height-avg*50-1,1024,2);
     
     float offset = avg - historyAvg;
     
     fill(255,0,0);
     
     int life = 5;
     String buffer = "";
     boolean all = false;
     boolean firstAlone = false;
     if(offset > 0.5*historyAvg && r1 < 0) {
       r1 = life;
       all = true;
       firstAlone = true;
       /*if(firstAloneCounter >= 6) {
         createFireworks(historyAvg);
         firstAloneCounter -= 3;
       }*/
       createFireworks(historyAvg);
     }
     if(offset > historyAvg*1 && r2 < 0) {
       r2 = life;
       firstAlone = false;
       firstAloneCounter++;
       if(random(1) < 1) {
         createStars(true);
         if(random(1) < 0.07) {
           dropStars();
         }
       }
     }
     else { 
       all = false;
     }
     if((offset > historyAvg*2 || offset > 10) && r3 < 0) {
       r3 = life;
       
       createFallingStars();
       if(all || firstAlone) {
         createFireworks(historyAvg);
       }
       firstAlone = false;
       firstAloneCounter = 0;
     }
     if(firstAlone) {
       firstAloneCounter++;
     }
     
     avgHistory.add(avg);
     
     if(avgHistory.size() == 100) {
       avgHistory.remove(0);
       
     }
  }
  
  private void createFireworks(float historyAvg) {
    println(historyAvg);
    if(historyAvg > 2) {
       Sky.this.createFireworks(true);
     }
     else {
       Sky.this.createFireworks(true, SMALL);
     }
  }
}
