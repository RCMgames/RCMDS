class EnableSwitch {
  float x;
  float y;
  float w;
  float h;
  float sliderPos;

  EnableSwitch(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  boolean run(boolean enabled) {
    return enabled;
  }
}
