float d;
color c;

void setup(){

  size(500, 500);

}

void draw(){
  
  background(0);
  strokeWeight(2);
  stroke(255);
  fill(255);
  
  loadPixels();
  
  for(int x = 0; x < width; x++){
  
    for(int y = 0; y < height; y++){
    
      int loc = x + y * width;
      
      d = (dist(x, y, mouseX, mouseY)) * 5;
      
      c = color(255-d);
      
      pixels[loc] = c; 
    
    }
    
    updatePixels();
  
  }
  
  for(int x = 50; x < width; x += 50){
  
    for(int y = 50; y < height; y += 50){
    
      PVector v = new PVector(x, y);
      PVector mouse = new PVector(mouseX, mouseY);
      
      mouse.sub(v);
      mouse.mult(0.05);
      
      pushMatrix();
        
        translate(v.x, v.y);
            
        line(0 - mouse.x, 0 - mouse.y, mouse.x, mouse.y);
        ellipse(mouse.x, mouse.y, 5, 5);
        
      popMatrix();
    
    }
  
  } 

}
