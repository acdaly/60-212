var hourCircles = []
var prevMin;

function setup() {
  createCanvas(500, 600);
  gravity = createVector(0, .2);
  dim = width / 2;
  background(0);
  noStroke();
 for (var i = 0; i < 24; i++) {
  hourCircles[i] = [];
  hourX = random(12, width - 12);
  hourY = random(12, height - 12)
  for (var x = 0; x < 60; x++){
    angle = (x+1)*6
    hourCircles[i][x] = new MinuteCircle(hourX + 10*cos(angle), hourY + 10* sin(angle))
    if (i < hour()) {
      hourCircles[i][x].applyForce(1);
    }
    if (i == hour()) {
      if (x <= minute()) {
        hourCircles[i][x].applyForce(5);
      }
    }
    
  }
  }
}

function draw() {
  background(0);
  var m = minute();
  var h = hour();
  for (var i = 0; i < hourCircles.length; i++) {
    for (var x = 0; x < 60; x++) {
      hourCircles[i][x].update();
      hourCircles[i][x].drawSelf();
    }
  }
  if (prevMin != m) {
    hourCircles[h][m].applyForce(3);
    prevMin = m;
  }
  
}

function mousePressed(){
  setup()
}

function MinuteCircle(x, y) {
  //references Dan Shiffman's fireworks
  //https://www.youtube.com/watch?v=CKeyIbT3vXI

  this.pos = createVector(x, y);
  this.vel = createVector(x, y);
  this.vel.x = -1
  this.vel.y = -1
  this.acc = createVector(x, y)
  this.acc.x = 0;
  this.acc.y = 0;

  this.drawSelf = function() {
    fill(125, 125, 100, 10);
    ellipse(this.pos.x, this.pos.y, 20, 20);
    fill(200, 200, 150)
    ellipse(this.pos.x, this.pos.y, 7, 7);
    //drawGradientOne(this.pos.x, this.pos.y, 7);
  }

  this.applyForce = function(force) {
    this.acc.x += force * random(-1, 1);
    this.acc.y += force * random(-1, 1);
  }

  this.update = function() {
    this.vel.add(this.acc);
    if (this.pos.x < 0 || this.pos.x > width){
      this.vel.x = this.vel.x * -1
      this.pos.add(this.vel);
    }
    if (this.pos.y < 0 || this.pos.y > height) {
      this.vel.y = this.vel.y * -1;
      this.pos.add(this.vel);
    } else {
      this.pos.add(this.vel);
      
    }

    this.acc.mult(0);
  }
}

/*function drawGradientOne(x, y, radius) {
  var R = 80;
  var G = 80;
  var B = 70;
  for (var r = radius; r > 0; --r) {
    fill(R, G, B);
    ellipse(x, y, r, r);
    R = (R + 5);
    G = (G + 5);
    B = (B + 4);
  }
}
*/
