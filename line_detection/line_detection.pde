int numPoints = 20;
Point[] shape;

Point endP;

void setup() {
    size(400, 400);
    smooth();
    shape = new Point[numPoints];
    endP = new Point();

    makeRandomShape();
    //println(shape);
}

void draw() {
    background(255, 255, 255);
    stroke(0, 0, 0);

    drawShape();
    if (mousePressed == true) {
        stroke(255, 0, 0);
        line(mouseX, mouseY, endP.x, endP.y);

        fill(0, 0, 0);
        boolean isect = isectTest();
        if (isect == true) {
            text("Inside", mouseX, mouseY);
        } else {
            text("Outside", mouseX, mouseY);
        }
    }
}

void mousePressed() {
    endP.x = random(-1, 1) * 2 * width;
    endP.y = random(-1, 1) * 2 * height;
}

void drawShape() {
    for (int i = 0; i < numPoints; i++) {
        int start = i;
        int end = (i + 1) % numPoints;

        line(shape[start].x + width/2.0f, 
             shape[start].y + height/2.0f,
             shape[end].x   + width/2.0f, 
             shape[end].y   + height/2.0f);
    }
}

boolean isectTest() {
    int numInters = 0;
    for (int i = 0; i < numPoints; i++) {
        Point start = shape[i].copy();
        Point end = shape[(i + 1) % numPoints].copy();
        float slopeP = slope(start,end);
        Point mouse = new Point();
        mouse.x = mouseX;
        mouse.y = mouseY;
        float slopeM = slope(mouse, endP);
        if (slopeM == slopeP) {
          continue;
        }
        start.x += width/2.0f;
        start.y += height/2.0f;
        end.x += width/2.0f;
        end.y += height/2.0f;
        float x = (slopeM*mouse.x-slopeP*start.x + start.y-mouse.y)/(slopeM-slopeP);
        float y = slopeM*(x-mouse.x)+mouse.y;

        if (isBetween(x, mouse.x, endP.x) && isBetween(x, start.x, end.x) &&
        isBetween(y, mouse.y, endP.y) && isBetween(y, start.y, end.y)) {
          numInters = numInters + 1;
        }
    }
    println(numInters);
    if (numInters % 2 == 0) {
      return false;
    } else {
      return true;
    }
}

boolean isBetween(float val, float range1, float range2) {
    float largeNum = range1;
    float smallNum = range2;
    if (smallNum > largeNum) {
        largeNum = range2;
        smallNum = range1;
    }

    if ((val < largeNum) && (val > smallNum)) {
        return true;
    }
    return false;
}

float slope(Point a, Point b) {
  //return (float)(a.y-b.y)/(a.x-b.x);
  return (float)(b.y-a.y)/(b.x-a.x);
}

void makeRandomShape() {
    float slice = 360.0 / (float) numPoints;
    for (int i = 0; i < numPoints; i++) {
        float radius = (float) random(5, 100);
        shape[i] = new Point();
        shape[i].x = radius * cos(radians(slice * i));
        shape[i].y = radius * sin(radians(slice * i));
    }
}
