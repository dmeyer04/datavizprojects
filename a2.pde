boolean alreadyDrag = false;
ForceDirectedLayout fdl;
float MASS_SCALE = 5 * width/height;
double kineticEnergy = 1;

PVector v1 = new PVector(0,100);
PVector v2 = new PVector(-86.185, 98.254); // diff = width/10
PVector v3 = new PVector(-107.863, 94.482); // diff = depth/10
float depth = (float)Math.abs(v2.x - v2.y)*10;

void setup() {
  // 
  size(1844, 1000);
  //surface.setResizable(true);
  fdl = new ForceDirectedLayout();
}

void draw() {
  fdl.render();
  for (Ball ball: fdl.balls) {
    ball.checkHover();  
  }
}
void mouseDragged() {
  for (Ball ball: fdl.balls) {
   ball.checkDrag();
 }
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  for (Ball ball: fdl.balls) {
    ball.changeMass(e);  
  }
}
