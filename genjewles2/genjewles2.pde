/**
 * Part of a series of articles on Processing 2.
 * Blog post here:
 * http://vormplus.be/blog/article/drawing-shapes-with-quadratic-vertices
 */
 
 
 boolean saveOne = false;



void setup() {
  colorMode(HSB, 100);
  size( 1200, 1200, P2D );
  smooth();
  frameRate (1);
}

void draw() {
  translate( width/2, height/2 );
  background( 0, 0, 80 );
  float stepAngle = TWO_PI / 6;
  float outer, inner;

  fill( 0, 0, 20 );
  noStroke();


  outer = random( 500, 700 );
  inner = outer - random( 200, 300 );
  beginShape();
  for ( int i = 0; i < 7; i++ ) {

    println(inner, outer);
    float x = cos( stepAngle * i ) * inner;
    float y = sin( stepAngle * i ) * inner;

    float cx = cos( stepAngle * i - ( stepAngle / 2 ) ) * outer;
    float cy = sin( stepAngle * i - ( stepAngle / 2 ) ) * outer;

    if ( i == 0 ) {
      vertex( x, y );
    } else {
      fill(random(100), random(100), random(100));
      quadraticVertex( cx, cy, x, y );
    }
  }
  endShape( CLOSE );

  


  if ( saveOne ) {
    String timestamp;
    timestamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);

    saveFrame("../Exports/"+timestamp+".PNG");
  }
}