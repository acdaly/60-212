//Andrew Chang helped me convert Javascript to Java :')

void setup() {
  size(500, 500);
  background(255);
}

class Line{
  float x1, y1, x2, y2, m, b;
  Line(float x1, float y1, float x2, float y2, float m){
    
    if (x1 < x2){
      this.x1 = x1;
      this.x2 = x2;
      } 
    else {
      this.x1 = x2; 
      this.x2 = x1;
    }
    this.y1 = y1;
    this.y2 = y2;
    this.m = m;
    float b = y1 - (m * x1);
    this.b = b;
    
    line(x1, y1, x2, y2);
  }
}
void draw(){}
void mousePressed(){
  //reset background
  fill(255);
  noStroke();
  rect(0,0,500,500);
  stroke(1);
  //draw lines
  int count = 10;
  Line[] lines = new Line[width];

  for (int i = 0; i < count; i++){
    float x1 = random(0,500);
    float y1 = random(0,500);
    float x2 = random(0,500);
    float y2 = random(0,500);
    float m  = 0.0;
    if (x1 == x2) {m = 0;} 
    else{
    // if m != 0 (so no division by 0)
      if (x2 > x1) {m = ((y2 - y1)/(x2 - x1));
        } else {m = ((y1 - y2)/(x1 - x2));}}
    lines[i] = new Line(x1, y1, x2, y2, m);
  }
  
  for (int current = 0; current < count; current++) {
    Line currentLine = lines[current];
    for (int other = 1; other < count; other++){
      if (current < other) {
        println(current + "" + other);
        Line otherLine = lines[other];
        if (currentLine.m != otherLine.m){
          float x = (currentLine.b - otherLine.b)/(otherLine.m - currentLine.m);
          float y = (currentLine.m*x) + currentLine.b;
          println(currentLine.x1 +", "+ x +", " + currentLine.x2 +", "+ (x < currentLine.x2));
          if ((currentLine.x1 <= x && x <= currentLine.x2) && (otherLine.x1 <= x && x <= otherLine.x2)){
            fill(0);
            noStroke();
            ellipse(x, y, 10, 10);
            }
        }
      }
    }
    
  }
}