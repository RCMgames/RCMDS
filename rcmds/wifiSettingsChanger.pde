TypeBox portWifiSettingsTypeBox;
TypeBox ipWifiSettingsTypeBox;
void setupWifiSettingsChanger(float x, float y) {
  ipWifiSettingsTypeBox=new TypeBox(x, 25+y, width/4, 50, "ip: ", color(0, 255, 0));
  portWifiSettingsTypeBox=new TypeBox(x, 76+y, width/4, 50, "port: ", color(0, 255, 0));
}
void runWifiSettingsChanger() {
  wifiIP=ipWifiSettingsTypeBox.run(wifiIP);
  wifiPort=portWifiSettingsTypeBox.run(wifiPort);
}
