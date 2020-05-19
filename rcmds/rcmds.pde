/////////////////////////add interface elements here
Joystick driveStick;
Slider servoSlider;
//////////////////////
float batVolt=0.0;
boolean enabled=false;
////////////////////////add variables here
PVector driveVect=new PVector(0, 0);
float servoVal=0.0;
void setup() {
  //fullScreen();//remove for Java mode
  size(1920, 1080);//remove for Android mode
  rcmdsSetup();
  setupGamepad("Feather 32u4");//name of gamepad device, remove for Android mode
  //setup UI here
  driveStick=new Joystick(width*.8, height*.5, width*.3, 1, 1, color(0, 100, 0), color(255), "X Axis", "Y Axis", 'w', 'a', 's', 'd', TILT_X, TILT_Y);
  servoSlider=new Slider(width*.1, height*.6, height*.7, width*.05, 1, color(150, 0, 150), color(255), "Z Axis", UP, DOWN, .01, 0, false, false);
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=runEnableSwitch(enabled);
  /////////////////////////////////////add UI here
  driveVect=driveStick.run(new PVector(0, 0));
  servoVal=servoSlider.run(servoVal);
  String[] msg={"battery voltage", "ping", "drive speed", "drive turn", "servoVal"};
  String[] data={str(batVolt), str(wifiPing), str(driveVect.y), str(driveVect.x), str(servoVal)};
  dispTelem(msg, data, width/2, height*2/3, width/4, height*2/3, 20);
  sendWifiData(true);
}
void WifiDataToRecv() {
  batVolt=recvFl();
  ////////////////////////////////////add data to read here
}
void WifiDataToSend() {
  sendBl(enabled);
  ///////////////////////////////////add data to send here
  sendVect(driveVect);
  sendFl(servoVal);
}
