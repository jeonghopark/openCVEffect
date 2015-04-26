import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage  img, thresh, blur, adaptive, gray;

void setup() {
  size(640,480);

  video = new Capture(this,320,240);
  opencv = new OpenCV(this,320,240);
  
  video.start();
  
}

void draw() {
  opencv.loadImage(video);
  gray = opencv.getSnapshot();
  
  opencv.threshold(80);
  thresh = opencv.getSnapshot();
  
  opencv.loadImage(gray);
  opencv.blur(10);  
  blur = opencv.getSnapshot();
  
  opencv.loadImage(gray);
  opencv.adaptiveThreshold(591, 1);
  adaptive = opencv.getSnapshot();

  pushMatrix();
  image(video, 0, 0);
  image(thresh, video.width, 0);
  image(blur, 0, video.height);
  image(adaptive, video.width, video.height);
  popMatrix();

  fill(0);
  text("source", video.width - 100, 20 );
  text("threshold", video.width*2 - 100, 20 );
  text("blur", video.width - 100, video.height + 20 );
  text("adaptive threshold", video.width*2 - 150, video.height + 20 );
}

void captureEvent(Capture c) {
  c.read();
}

