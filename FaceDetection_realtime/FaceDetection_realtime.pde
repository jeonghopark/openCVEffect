import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {

  scale(2);
  opencv.loadImage(video);

  background(120);
  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);

    float faceMiddlePos = faces[i].x + faces[i].width/2;

    if (faceMiddlePos>width/4) {
      text("BITTE LINKS", width/4, height/4);
    }
    else {
      text("BITTE RECHTS", width/4, height/4);
    }
  }
}

void captureEvent(Capture c) {
  c.read();
}

