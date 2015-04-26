import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage src, canny, scharr, sobel;

void setup() {
  size(640,480);

  video = new Capture(this,640,480);  
  opencv = new OpenCV(this,640,480);
  
  video.start();
  

}


void draw() {
  
  opencv.loadImage(video);
  
  opencv.findCannyEdges(20,75);
  canny = opencv.getSnapshot();
  
  opencv.loadImage(video);
  opencv.findScharrEdges(OpenCV.HORIZONTAL);
  scharr = opencv.getSnapshot();
  
  opencv.loadImage(video);
  opencv.findSobelEdges(1,0);
  sobel = opencv.getSnapshot();
  
  
  pushMatrix();
  scale(0.5);
  image(video, 0, 0);
  image(canny, video.width, 0);
  image(scharr, 0, video.height);
  image(sobel, video.width, video.height);
  popMatrix();

  text("Source", 10, 25); 
  text("Canny", video.width/2 + 10, 25); 
  text("Scharr", 10, video.height/2 + 25); 
  text("Sobel", video.width/2 + 10, video.height/2 + 25);
}

void captureEvent(Capture c){
 c.read(); 
}
