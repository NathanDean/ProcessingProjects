PImage zen;

void setup(){

  zen = loadImage("zen.jpg");
  
  size(2560, 1600);
  
}

void draw(){
  
  loadPixels();
  
  for(int i = 0; i < 5000; i++){
  
    int x = int(random(width));
    int y = int(random(height));
    
    int loc = x + y * width;
    
    float r = red(zen.pixels[loc]);
    float g = green(zen.pixels[loc]);
    float b = blue(zen.pixels[loc]);
    
    color c = color(r, g, b, 100);
    
    fill(c);
    stroke(c);
    //line(x, y, x * 1.01, y * 1.01);
    ellipse(x, y, 10, 10);
    
  }
  
}
