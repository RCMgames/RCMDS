EnableSwitch enableSwitch;
int TILT_X=1;
int TILT_Y=2;
void rcmdsSetup() {
  orientation(LANDSCAPE);
  shapeMode(CENTER);
  rectMode(CENTER);
  background(0);
  mousescreen=new Mousescreen();
  keyboardCtrl=new KeyboardCtrl();
  setupWifiSettingsChanger(width/2, 0);
  udp = new UDP(this);
  udp.listen(true);
  enableSwitch=new EnableSwitch(width*.15, height/15, width/4, height/9);
}
void endOfDraw() {
  mousePress=false;
}
