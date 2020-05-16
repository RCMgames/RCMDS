/////////////////////////add interface elements here
Joystick stick1;
Button b1;
//////////////////////
float batVolt=0.0;
boolean enabled=false;///add variables here
void setup() {
  //fullScreen();//remove for Java mode
  size(1920, 1080);//remove for Android mode
  rcmdsSetup();
  //setup UI here
  stick1=new Joystick(width*.8, height*.6, 500, 255, 255, color(255, 0, 0), color(255), "X Axis", "Y Axis", 'w', 'a', 's', 'd', TILT_X, TILT_Y);
  b1=new Button(100, 500, 100, color(100), color(0, 200, 0), "Button 1", ' ', false, false, "b1");
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=runEnableSwitch(enabled);
  /////////////////////////////////////add UI here
  stick1.run(new PVector(0, 0));
  b1.run();
  String[] msg={"battery voltage", "ping"};
  String[] data={str(batVolt), str(wifiPing)};
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
}
