EnableSwitch enableSwitch;
void rcmdsSetup() {
  orientation(LANDSCAPE);
  shapeMode(CENTER);
  rectMode(CENTER);
  background(0);
  setupGamepad("Feather 32u4");//name of gamepad device, remove for Android mode
  //touchscreen=new Touchscreen();//remove for Java mode
  mousescreen=new Mousescreen();//remove for Android mode
  keyboardCtrl=new KeyboardCtrl();//remove for Android mode
  //setupAccelerometer();//remove for Java mode
  setupWifiSettingsChanger(width/2, 0);
  udp = new UDP(this);
  udp.listen(true);
  enableSwitch=new EnableSwitch(width/12, height/12, width/6, height/6);
}
boolean runEnableSwitch(boolean en) {
  return enableSwitch.run(en);
}
