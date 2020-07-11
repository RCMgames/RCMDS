/////////////////////////add interface elements here

//////////////////////
float batVolt=0.0;
boolean enabled=false;
////////////////////////add variables here

void setup() {
  size(1920, 1080);
  rcmdsSetup();
  //setup UI here
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=enableSwitch.run(enabled);
  /////////////////////////////////////add UI here

  String[] msg={"battery voltage", "ping"};
  String[] data={str(batVolt), str(wifiPing)};
  dispTelem(msg, data, width/2, height*2/3, width/4, height*2/3, 20);

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
}
