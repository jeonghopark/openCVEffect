import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640,480);
  video = new Capture(this, 640, 480);  
  opencv = new OpenCV(this, 640, 480);

  video.start();  
}

void draw() {
  opencv.loadImage(video);

  opencv.invert();
  
  int valueTH = (int)map(mouseX,0,width, 0,100);
  opencv.brightness(valueTH);

  PVector loc = opencv.max();
  
  println( loc );
  
  image(opencv.getOutput(), 0, 0); 
  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
  ellipse(loc.x, loc.y, 10, 10);
}


void captureEvent(Capture c){
 c.read(); 
}
