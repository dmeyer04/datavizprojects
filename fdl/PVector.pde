public class PVector {
  public PVector copy (PVector origin) {
    return new PVector(origin.x, origin.y, origin.z);
  }

  public PVector normalize (PVector origin) {
    PVector v = copy(origin);
    float m = v.mag();
    if (m != 0 && m != 1) {
      v.div(m);
    }
    return v;
  }

  public PVector mult (PVector origin) {
  }

  public PVector sub(PVector v1, PVector v2, PVector target) {
    if (target == null) {
      target = new PVector(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
    } else {
      target.set(v1.x - v2.x, v1.y - v2.y, v1.z - v2.z);
    }
    return target;
  }

  public PVector sub(PVector v1, PVector v2) {
    return sub(v1, v2, null);
  }
  public PVector sub(float x, float y, float z) {
    this.x -= x;
    this.y -= y;
    this.z -= z;
    return this;
  }
  public PVector sub(PVector v) {
    x -= v.x;
    y -= v.y;
    z -= v.z;
    return this;
  }

  public PVector add(PVector v1, PVector v2, PVector target) {
    if (target == null) {
      target = new PVector(v1.x + v2.x,v1.y + v2.y, v1.z + v2.z);
    } else {
      target.set(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
    }
    return target;
  }
  public PVector add(PVector v) {
    x += v.x;
    y += v.y;
    z += v.z;
    return this;
  }

  public PVector add(float x, float y) { 
    this.x += x; 
    this.y += y;
    return this;
  }


  public PVector add(float x, float y, float z) { 
    this.x += x; 
    this.y += y;
    this.z += z;
    return this;
  }


  public PVector add(PVector v1, PVector v2) { 
    return add(v1, v2, null);
  }


  public PVector add(PVector v1, PVector v2, PVector target) {
    if (target == null) {
        target = new PVector(v1.x + v2.x,v1.y + v2.y, v1.z + v2.z);
    }
    else {
      target.set(v1.x + v2.x, v1.y + v2.y, v1.z + v2.z);
    }
    return target;
  }
}
