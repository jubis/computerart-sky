import traer.physics.*;
import java.util.List;

class Firework {
  
  ParticleSystem ps;
  List<Particle> particles = new ArrayList<Particle>();
  final int type;
  
  public Firework(int type, int x, int y) {
    ps = new ParticleSystem( 2, 2 );
    this.type = type;
    println(this.type);
    switch(this.type) {
      case RAINBOW: {
        for ( int j = 0; j < 400; j++ ) {
          Particle p = ps.makeParticle( random(2, 100), random(-10, 10)+x, random(-10, 10)+y, 0 );
          particles.add( p );
          p.velocity().set( (1/sin(random(-0.5, 0.5)))*0.6, (1/sin(random(-0.5, 0.5)))*0.4, 0 );
        }
        break;
      }
      case WHITE: {
        for ( int j = 0; j < 400; j++ ) {
          Particle p = ps.makeParticle( random(30, 140), random(-10, 10)+x, random(-10, 10)+y, 0 );
          particles.add(p);
          float angle = random(-PI, PI);
          p.velocity().set( cos(angle)*5,sin(angle)*5, 0 );
        }
        break;
      }
    }
  }
  
  public void draw() {
    ps.tick(4);
    
    noStroke();
    switch(this.type) {
      case RAINBOW: {
        for ( int i = 0; i < particles.size(); i++ ) { 
          Particle p = particles.get(i);
          
          float blue = 150;
          if ( p.age() > random(0, 200) ) {
            blue = 0;
          }
          fill( abs(p.velocity().x()*20), abs(p.velocity().y()*20), blue );
          
          ellipse( p.position().x(), p.position().y(), p.mass()/10, p.mass()/10 );
        }
        break; 
      }
      case WHITE: {
        for ( int i = 0; i < particles.size(); i++ ) { 
          Particle p = particles.get(i);
          fill( p.velocity().length()*200 );
          ellipse( p.position().x(), p.position().y(), p.mass()/10, p.mass()/10 );
        }
        break;
      }
    }
    
    for(int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      if ( p.age() > random( 20,400 ) ) {
        ps.removeParticle( p );
        particles.remove( p );
      }
    }
    
  }
}
