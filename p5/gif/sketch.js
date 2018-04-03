var lineList = [new Line(50, 0, 500, 450),
  new Line(88, 0, 500, 488), new Line(168, 0, 432, 500), new Line(256, 0, 344, 500), 
  new Line(334, 0, 266, 500), new Line(420, 0, 180, 500), new Line(500, 8, 92, 500),
  new Line(500, 94, 6, 500), new Line(500, 186, 0, 412), new Line(500, 274, 0, 324),
  new Line(500, 360, 0, 238), new Line(500, 442, 0, 156), new Line(470, 500, 0, 70),
  new Line(388, 500, 14, 0), new Line(296, 500, 106, 0), new Line(210, 500, 192, 0),
  new Line(122, 500, 280, 0), new Line(40, 500, 362, 0), new Line(0, 454, 446, 0),
  new Line(0, 364, 500, 38), new Line(0, 272, 500, 130), new Line(0, 192, 500, 210),
  new Line(0, 102, 500, 300), new Line(0, 12, 500, 390), new Line(62, 0, 500, 462),
  new Line(146, 0, 454, 500)

, new Line(220, 0, 380, 500), new Line(108, 500, 294, 0),
  new Line(500, 40, 60, 500), new Line(500, 308, 0, 290), new Line(364, 500, 38, 0), 
  new Line(6, 500, 396, 0), new Line(0, 412, 488, 0), new Line(0, 216, 500, 186), 
  new Line(250, 0, 350, 500),new Line(0, 328, 500, 74),
  new Line(452, 0, 148, 500), new Line(500, 218, 0, 380), new Line(136, 0, 464, 500), 
  new Line(316, 0, 284, 500), new Line(500, 78, 22, 500), new Line(500, 336, 0, 262),
  new Line(402, 500, 0, 2), new Line(184, 500, 218, 0), new Line(0, 468, 432, 0), 
  new Line(0, 250, 500, 152), new Line(0, 32, 500, 370), new Line(180, 0, 420, 500),
  new Line(406, 0, 194, 500), new Line(500, 114, 0, 484), new Line(500, 316, 0, 282), 
  new Line(434, 500, 0, 34), new Line(222, 500, 180, 0), new Line(22, 500, 380, 0)];

var t = 2;


function setup() {
  createCanvas(500, 500);
  background(0);
}

function Line(x1, y1, x2, y2) {
  this.x1 = x1;
  this.y1 = y1;
  this.x2 = x2;
  this.y2 = y2;
  this.DrawGrid = function() {
    if (this.y2 == height) {
      this.x2 = this.x2 - t;
    }
    if (this.x1 == width) {
      this.y1 = this.y1 + t;
    }
    if (this.x2 === 0) {
      this.y2 = this.y2 - t;
    }
    if (this.y1 == height) {
      this.x1 = this.x1 - t;
    }
    if (this.y2 === 0) {
      this.x2 = this.x2 + t;
    }
    if (this.x1 === 0) {
      this.y1 = this.y1 - t;
    }
    if (this.x2 == width) {
      this.y2 = this.y2 + t;
    }
    if (this.y1 === 0) {
      this.x1 = this.x1 + t;
    }
    stroke(255, 255, 255, 150);
    strokeWeight(1);
    line(this.x1, this.y1, this.x2, this.y2);
  }
}

function mousePressed() {
  println(lineList[0].x1 + ", " + lineList[0].y1 + ", " + lineList[0].x2 + ", " + lineList[0].y2)
}

function draw() {
  background(0);
  for (var thing = 0; thing < lineList.length; thing++) {
    lineList[thing].DrawGrid();

  }
}