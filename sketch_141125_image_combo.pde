PImage img1, img2; 
int[] brightness = new int[513360];
int threshold = 0;

void setup() {
  size(930, 522);
  background(0);
  img1=loadImage("colas.jpg");
  img2=loadImage("sincity.jpg");
  textSize(32);
  text("Click on the screen to discover the image", width/2-330, height/2-32); 
  fill(0, 102, 153);
  text("Click in different areas to change the image", width/2-340, height/2+32); 
}

void draw() {
  loadPixels(); 
  
  // first image : check  brightness
  img1.loadPixels(); 
  for (int x=0; x < width; x+=1) {
    for (int y=0; y < height; y+= 1) {
      int loc = x + y*width;
      color c = img2.get(x, y);
      brightness[loc] = (int)brightness(c);
    }
  }
  
  //second image : check RGB value
  img2.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img1.pixels[loc]);
      float g = green(img1.pixels[loc]);
      float b = blue(img1.pixels[loc]);
      pixels[loc] =  color(r, g, b);

    }
  }
 
  if(mousePressed == true){
   background(0);
   threshold = ((width-mouseX)*255)/width;
  
   for(int z = 0; z<pixels.length; z++){
      int yPos = floor(z/width);
      int xPos = z - yPos*width;
      stroke(pixels[z]);
      if(brightness[z] > threshold){
        rect(xPos, yPos, 1, 1);
      }
    }     
  }

}


