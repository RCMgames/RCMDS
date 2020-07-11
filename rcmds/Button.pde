class Button {
  color background;
  color forground;
  float xPos;
  float yPos;
  float size;
  int mouseID;
  String gpButton;
  boolean momentary;
  boolean lastVal;
  boolean val;
  boolean pressed;
  boolean wasPressed;
  int keyboard;
  String label;
  long millisWhenPressed;
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
    millisWhenPressed=0;
    mouseID=mousescreen.registerZone(xPos, yPos, size, size);
  }
  boolean run() {
    wasPressed=pressed;
    lastVal=val;
    pressed=(
      mousescreen.readPressed(mouseID)
      ||keyboardCtrl.isPressed(keyboard)
      ||gamepadButton(gpButton, false)
      );

    if (momentary) {
      val=pressed;
    } else {
      if (pressed&&!wasPressed) {
        val=!val;
      }
    }
    if (justPressed()) {
      millisWhenPressed=millis();
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
  boolean getVal() {
    return val;
  }
  long getMillisWhenPressed() {
    return millisWhenPressed;
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
  boolean toggledOff() {
    return lastVal&&!val;
  }
  boolean toggledOn() {
    return !lastVal&&val;
  }
}
