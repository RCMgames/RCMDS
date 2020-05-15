int wifiPort=25210;
String wifiIP="10.25.21.1";
///////////////////////////////
Joystick stick1;
Button b1;

float batVolt=0.0;
boolean enabled=false;
void setup() {
  //fullScreen();//remove for Java mode
  size(1920, 1080);//remove for Android mode
  rcmdsSetup();
  setupGamepad("Feather 32u4");//name of gamepad device, remove for Android mode
  //touchscreen=new Touchscreen();//remove for Java mode
  mousescreen=new Mousescreen();//remove for Android mode
  keyboardCtrl=new KeyboardCtrl();//remove for Android mode
  //setupAccelerometer();//remove for Java mode
  setupWifiSettingsChanger(width/2, 0);
  //setup UI here
  stick1=new Joystick(1600, 600, 500, 255, 255, color(255, 0, 0), color(255), "X Axis", "Y Axis", 'w', 'a', 's', 'd', 0, TILT_Y);
  b1=new Button(100, 300, 100, color(100), color(0, 200, 0), "Button 1", ' ', false, false);
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=runEnableSwitch(enabled);
  //add UI here
  stick1.run(new PVector(0, 0));
  b1.run();
  String[] msg={"battery voltage", "ping"};
  String[] data={str(batVolt), str(wifiPing)};
  dispTelem(msg, data, width/2, height*2/3, width/4, height*2/3, 20);
  mousePress=false;//remove for Android mode
  sendWifiData(true);
}
void WifiDataToParse() {
  batVolt=parseFl();
  //add data to read here
}
void WifiDataToSend() {
  addBoolean(enabled);
  //add data to send here
}
