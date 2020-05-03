class Joystick {
  color background;
  color stick;
  float xPos;
  float yPos;
  float size;
  float xRange;
  float yRange;
  int touchID;
  int mouseID;
  String xa;
  String ya;
  final float stickSize=.25;
  Joystick(float _xPos, float _yPos, float _size, float _xRange, float _yRange, color _background, color _stick, String _xa, String _ya) {
    xPos=_xPos;
    yPos=_yPos;
    size=_size;
    background=_background;
    stick=_stick;
    xRange=_xRange;
    yRange=_yRange;
    xa=_xa;
    ya=_ya;
    //touchID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    mouseID=mousescreen.registerZone(xPos, yPos, size, size);//remove for Android mode
  }
  PVector run(PVector v) {
    v=vectMult(v, new PVector(1/xRange, 1/yRange));
    noStroke();
    fill(background);
    rect(xPos, yPos, size, size);
    if (xa!=""&&ya!="") {
      v=gamepadVect(xa, ya);//remove for Android mode
    }
    v=mousescreen.readPos(mouseID, v);//remove for Android mode
    //v=touchscreen.readPos(touchID, v);//remove for Java mode
    fill(stick);
    ellipse(xPos+size/2*v.x, yPos-size/2*v.y, stickSize*size, stickSize*size);
    v=vectMult(v, new PVector(xRange, yRange));
    return v;
  }
}
PVector vectMult(PVector a, PVector b) {
  return new PVector(a.x*b.x, a.y*b.y);
}
