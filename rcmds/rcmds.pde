/////////////////////////add interface elements here

//////////////////////
float batVolt=0.0;
boolean enabled=false;
////////////////////////add variables here
float speed=0.0;
Slider speedSl;
void setup() {
  fullScreen();
  rcmdsSetup();
  //setup UI here
  //Slider(float _xPos, float _yPos, float _size, float _width, float _low, float _high, color _background, color _stick, String _ga, int _pKey, int _mKey, float _inc, int _tilt, boolean _horizontal, boolean _reverse) {
  speedSl=new Slider(width/2, height/2, width*.8, 100, 0, 1, color(100, 100, 0), color(255), null, 0, 0, 0, 0, true, false);
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=enableSwitch.run(enabled);
  /////////////////////////////////////add UI here
  speed=speedSl.run(speed);
  //  String[] msg={"battery voltage", "ping"};
  //  String[] data={str(batVolt), str(wifiPing)};
  //  dispTelem(msg, data, width/2, height*2/3, width/4, height*2/3, 20);

  sendWifiData(true);
  endOfDraw();
}
void WifiDataToRecv() {
  batVolt=recvFl();
  ////////////////////////////////////add data to read here
}
void WifiDataToSend() {
  sendBl(enabled);
  ///////////////////////////////////add data to send here
  sendFl(speed);
}
