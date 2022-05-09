int cols;
int rows;
int scale = 30;

int w = 2000;
int h = 1500;

float tx = -w/2;
float ty = -h/2;
float tz = 0;

float flyingSpeed = 0;

float[][] terrain;

void setup(){
  
  size(800, 600, P3D);
  
  cols = w / scale;
  rows = h / scale;
  
  terrain = new float[cols][rows];
  
}

void draw(){
  
  //Sets speed
  flyingSpeed -= 0.025;
  
  float yOff = flyingSpeed;
  
  //Generates z-coordinate for each x, y-coordinate
  //By adding to xOff and yOff we ensure that the noise function generates a different value for each coordinate
  for(int y = 0; y < rows; y++){
    
    float xOff = 0;
      
    for(int x = 0; x < cols; x++){
    
      terrain[x][y] = map(noise(xOff, yOff), 0, 1, -300, 300);
      xOff += 0.075;
      
    }
      
    yOff += 0.075;
  
  }
  
  //Draw terrain
  background(64, 121, 140);
  fill(246, 241, 209);
  stroke(180, 180, 140);
  strokeWeight(1);

  translate(width/2, height/2);
  rotateX(PI/3);
  
  translate(tx, ty);
  
 
  
  for(int y = 0; y < rows - 1; y++){
  
    beginShape(TRIANGLE_STRIP);
    
    for(int x = 0; x < cols; x++){
    
      vertex(x * scale, y * scale, terrain[x][y]);
      vertex(x * scale, (y + 1) * scale, terrain[x][y + 1]);

    }
  
    endShape();
  
  }
  
}
