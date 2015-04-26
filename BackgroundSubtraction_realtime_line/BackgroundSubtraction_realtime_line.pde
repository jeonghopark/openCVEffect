import gab.opencv.*;
import processing.video.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640, 480);
  opencv = new OpenCV(this, 640, 480);
  
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  video.start();
}

void draw() {
  
  opencv.loadImage(video);
  image(video, 0, 0);  
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}

void captureEvent(Capture c){
 c.read(); 
}

void keyReleased(){
  if (key == ' '){
      opencv.startBackgroundSubtraction(5, 3, 0.5);
  }
}
