import gab.opencv.*;
import processing.video.*;
import java.awt.*;


Capture video;
OpenCV opencv;

int roiWidth = 150;
int roiHeight = 150;

boolean useROI = true;

void setup() {
  size(640,480);

  video = new Capture(this,640,480);
  opencv = new OpenCV(this,640,480);
  
  video.start();
}

void draw() {
  opencv.loadImage(video);

  if (useROI) {
    opencv.setROI(mouseX, mouseY, roiWidth, roiHeight);
  }

  opencv.findCannyEdges(20,75);
  image(opencv.getOutput(), 0, 0);
}

// toggle ROI on and off
void keyPressed() {
  useROI = !useROI;

  if (!useROI) {
    opencv.releaseROI();
  }
}


void captureEvent(Capture c) {
  c.read();
}

