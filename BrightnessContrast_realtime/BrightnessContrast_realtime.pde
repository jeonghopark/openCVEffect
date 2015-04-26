import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup(){
  size( 640, 480, P3D );
  video = new Capture(this, 640, 480 );
  opencv = new OpenCV(this, 640, 480 );

  video.start();  
}

void draw(){
  opencv.loadImage(video);
  opencv.brightness((int)map(mouseX, 0, width, -255, 255));
  image(opencv.getOutput(),0,0);
}

void captureEvent(Capture c){
  c.read();
}


