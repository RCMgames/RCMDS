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
  int upKey;
  int downKey;
  int leftKey;
  int rightKey;
  int xTilt;
  int yTilt;
  final float stickSize=.25;
  Joystick(float _xPos, float _yPos, float _size, float _xRange, float _yRange, color _background, color _stick, String _xa, String _ya, int _upKey, int _leftKey, int _downKey, int _rightKey, int _xTilt, int _yTilt) {
    xPos=_xPos;
    yPos=_yPos;
    size=_size;
    background=_background;
    stick=_stick;
    xRange=_xRange;
    yRange=_yRange;
    xa=_xa;
    ya=_ya;
    upKey=_upKey;
    downKey=_downKey;
    leftKey=_leftKey;
    rightKey=_rightKey;
    xTilt=_xTilt;
    yTilt=_yTilt;
    //touchID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    mouseID=mousescreen.registerZone(xPos, yPos, size, size);//remove for Android mode
  }
  PVector run(PVector v) {
    v=vectMult(v, new PVector(1/xRange, 1/yRange));
    noStroke();
    fill(background);
    rect(xPos, yPos, size, size);
    //if (xTilt==TILT_X) {
    //  v.set(readTip(v).x, v.y);
    //}
    //if (yTilt==TILT_Y) {
    //  v.set(v.x, readTip(v).y);
    //}
    //if (xTilt==TILT_Y) {
    //  v.set(readTip(v).y, v.y);
    //}
    //if (yTilt==TILT_X) {
    //  v.set(v.x, readTip(v).x);
    //} //remove for Java mode (12 lines)
    v=gamepadVect(xa, ya, v);//remove for Android mode
    v=keyboardCtrl.joystick(v, upKey, downKey, leftKey, rightKey);//remove for Android mode
    v=mousescreen.readPos(mouseID, v);//remove for Android mode
    //v=touchscreen.readPos(touchID, v);//remove for Java mode
    v.set(constrain(v.x, -1, 1), constrain(v.y, -1, 1));
    fill(stick);
    ellipse(xPos+size/2*v.x, yPos-size/2*v.y, stickSize*size, stickSize*size);
    v=vectMult(v, new PVector(xRange, yRange));
    return v;
  }
}
PVector vectMult(PVector a, PVector b) {
  return new PVector(a.x*b.x, a.y*b.y);
}
