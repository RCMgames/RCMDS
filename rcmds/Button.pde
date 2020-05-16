class Button {
  color background;
  color forground;
  float xPos;
  float yPos;
  float size;
  int touchID;
  int mouseID;
  String gpButton;
  boolean momentary;
  boolean lastVal;
  boolean val;
  boolean pressed;
  boolean wasPressed;
  int keyboard;
  String label;
  Button(float _xPos, float _yPos, float _size, color _background, color _forground, String _gpButton, int _keyboard, boolean _momentary, boolean _val, String _label) {
    xPos=_xPos;
    yPos=_yPos;
    size=_size;
    background=_background;
    forground=_forground;
    gpButton=_gpButton;
    momentary=_momentary;
    val=_val;
    lastVal=val;
    keyboard=_keyboard;
    label=_label;
    pressed=false;
    wasPressed=false;
    //touchID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    mouseID=mousescreen.registerZone(xPos, yPos, size, size);//remove for Android mode
  }
  boolean run() {
    wasPressed=pressed;
    lastVal=val;
    pressed=(
      mousescreen.readPressed(mouseID)//remove for Android mode
      //touchscreen.readPressed(touchID)//remove for Java mode
      ||keyboardCtrl.isPressed(keyboard)//remove for Android mode
      );
    pressed=gamepadButton(gpButton, pressed);//remove for Android mode

    if (momentary) {
      val=pressed;
    } else {
      if (pressed&&!wasPressed) {
        val=!val;
      }
    }
    noStroke();
    if (val) {
      fill(forground);
    } else {
      fill(background);
    }
    rect(xPos, yPos, size, size);
    fill(255);
    textSize(size/4);
    text(label, xPos, yPos, size, size);
    return val;
  }
  boolean justPressed() {
    return pressed&&!wasPressed;
  }
  void setVal(boolean v) {
    val=v;
  }
  boolean justReleased() {
    return !pressed&&wasPressed;
  }
  boolean unToggled() {
    return lastVal&&!val;
  }
}
