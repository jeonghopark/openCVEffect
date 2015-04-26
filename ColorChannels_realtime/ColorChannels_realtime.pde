import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage r, g, b, h, s, v;
int imgH, imgW;

void setup() {
  size( 640*3/2, 480*3/2, P3D );
  video = new Capture(this, 320, 240);
  opencv = new OpenCV(this, 320, 240);  

  imgW = 640/2;
  imgH = 480/2;

  video.start();
}

void draw() {
  background(0);
  opencv.loadImage(video);

  opencv.useColor(RGB);
  r = opencv.getSnapshot(opencv.getR());
  g = opencv.getSnapshot(opencv.getG());
  b = opencv.getSnapshot(opencv.getB());  

  noTint();
  image(video, imgW, 0, imgW, imgH);
  tint(255, 0, 0);
  image(r, 0, imgH, imgW, imgH);
  tint(0, 255, 0);
  image(g, imgW, imgH, imgW, imgH);
  tint(0, 0, 255);
  image(b, 2*imgW, imgH, imgW, imgH);

  opencv.useColor(HSB);
  h = opencv.getSnapshot(opencv.getH());
  s = opencv.getSnapshot(opencv.getS());  
  v = opencv.getSnapshot(opencv.getV());
  noTint();
  image(h, 0, 2*imgH, imgW, imgH);
  image(s, imgW, 2*imgH, imgW, imgH);
  image(v, 2*imgW, 2*imgH, imgW, imgH);
}


void captureEvent(Capture c) {
  c.read();
}

