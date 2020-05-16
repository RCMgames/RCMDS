//comment out all for Java mode
Touchscreen touchscreen;
class Touchscreen {
  ArrayList<TouchZone> zones=new ArrayList<TouchZone>();
  boolean[] claimedTouches={false, false, false, false, false, false, false, false, false, false};
  int lastTouchesLength=0;
  Touchscreen() {
  }

  int registerZone(float x, float y, float w, float h) {
    int id=zones.size();
    zones.add(new TouchZone(id, x, y, w, h));
    return id;
  }

  void deregisterZone(int id) {
    zones.remove(id);
  }

  PVector readPos(int id, PVector v) {
    TouchZone zone=zones.get(id);
    if (zone.touch==-1) {//untouched
      for (int i=0; i<touches.length; i++) {
        if (abs(touches[i].x-zone.x)<zone.w/2&&abs(touches[i].y-zone.y)<zone.h/2&&claimedTouches[touches[i].id]==false) {//touchdown in zone
          zone.touch=touches[i].id;
          claimedTouches[touches[i].id]=true;
          i=touches.length;
        }
      }
    } else {//paired to touch
      boolean touched=false;
      for (int i=0; i<touches.length; i++) {
        if (touches[i].id==zone.touch) {//paired touch found
          v.set(constrain((touches[i].x-zone.x)/zone.w*2, -1, 1), constrain(((-touches[i].y+zone.y)/zone.h*2), -1, 1));
          i=touches.length;
          touched=true;
        }
      }
      if (!touched) {
        claimedTouches[zone.touch]=false;
        zone.touch=-1;
      }
    }
    zones.set(id, zone);
    return v;
  }
  boolean readPressed(int id) {
    boolean touched=false;
    TouchZone zone=zones.get(id);
    if (zone.touch==-1) {//untouched
      for (int i=0; i<touches.length; i++) {
        if (abs(touches[i].x-zone.x)<zone.w/2&&abs(touches[i].y-zone.y)<zone.h/2&&claimedTouches[touches[i].id]==false) {//touchdown in zone
          zone.touch=touches[i].id;
          claimedTouches[touches[i].id]=true;
          i=touches.length;
        }
      }
    } else {//paired to touch
      touched=false;
      for (int i=0; i<touches.length; i++) {
        if (touches[i].id==zone.touch) {//paired touch found
          touched=true;
          i=touches.length;
        }
      }
      if (!touched) { 
        claimedTouches[zone.touch]=false;
        zone.touch=-1;
      }
    }
    zones.set(id, zone);
    return touched;
  }
}

class TouchZone {
  int id;
  int touch;
  float x;
  float y;
  float w;
  float h;
  TouchZone(int _id, float _x, float _y, float _w, float _h) {
    id=_id;
    touch=-1;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
}
