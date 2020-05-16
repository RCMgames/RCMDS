class Slider {
  color background;
  color stick;
  float xPos;
  float yPos;
  float s;
  float w;
  float range;
  int pointerID;
  String ga;
  int pKey;
  int mKey;
  int tilt;
  boolean horizontal;
  boolean reverse;
  float inc;
  Slider(float _xPos, float _yPos, float _size, float _width, float _range, color _background, color _stick, String _ga, int _pKey, int _mKey, float _inc, int _tilt, boolean _horizontal, boolean _reverse) {
    xPos=_xPos;
    yPos=_yPos;
    s=_size;
    w=_width;
    background=_background;
    stick=_stick;
    range=_range;
    ga=_ga;
    pKey=_pKey;
    mKey=_mKey;
    tilt=_tilt;
    inc=_inc;
    horizontal=_horizontal;
    reverse=_reverse;
    //pointerID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    pointerID=mousescreen.registerZone(xPos, yPos, boolAB(horizontal, s, w), boolAB(horizontal, w, s));//remove for Android mode
  }
  float run(float v) {
    if (reverse) {
      v=-v;
    }
    v=v/range;
    noStroke();
    fill(background);
    rect(xPos, yPos, boolAB(horizontal, s, w), boolAB(horizontal, w, s));
    //if (tilt==TILT_Y) {
    //  v=readTip(v).y;
    //}
    //if (tilt==TILT_X) {
    //  v=readTip(v).x;
    //} //remove for Java mode (6 lines)
    v=gamepadVal(ga, v);//remove for Android mode
    v+=inc*keyboardCtrl.slider(0, pKey, mKey);//remove for Android mode
    if (horizontal)v=mousescreen.readPos(pointerID, new PVector(v, 0)).x;//remove for Android mode
    else v=mousescreen.readPos(pointerID, new PVector(0, v)).y;//remove for Android mode
    //if (horizontal)v=touchscreen.readPos(pointerID, new PVector(v, 0)).x;//remove for Java mode
    //else v=touchscreen.readPos(pointerID, new PVector(0, v)).y;//remove for Java mode
    v=constrain(v, -1, 1);
    fill(stick);
    ellipse(xPos+boolAB(horizontal, s/2*v, 0), yPos-boolAB(horizontal, 0, s/2*v), w, w);
    v=v*range;
    if (reverse) {
      v=-v;
    }
    return v;
  }
}
float boolAB(boolean v, float a, float b) {
  if (v)return a;
  return b;
}
