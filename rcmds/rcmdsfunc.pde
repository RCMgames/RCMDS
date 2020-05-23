EnableSwitch enableSwitch;
int TILT_X=1;
int TILT_Y=2;
void rcmdsSetup() {
  orientation(LANDSCAPE);
  shapeMode(CENTER);
  rectMode(CENTER);
  background(0);
  touchscreen=new Touchscreen();
  setupAccelerometer();
  setupWifiSettingsChanger(width/2, 0);
  udp = new UDP(this);
  udp.listen(true);
  enableSwitch=new EnableSwitch(width*.15, height/15, width/4, height/9);
}
boolean runEnableSwitch(boolean en) {
  return enableSwitch.run(en);
}
