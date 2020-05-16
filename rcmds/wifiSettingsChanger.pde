TypeBox portWifiSettingsTypeBox;
TypeBox ipWifiSettingsTypeBox;
Button saveWifiSettingsButton;
Button recallWifiSettingsButton;
Button loadWifiHotspotSettingsButton;
void setupWifiSettingsChanger(float x, float y) {
  ipWifiSettingsTypeBox=new TypeBox(x, height/40+y, width/4, height/20, "ip: ", color(0, 255, 0));
  portWifiSettingsTypeBox=new TypeBox(x, 3*height/40+1+y, width/4, height/20, "port: ", color(0, 255, 0));
  saveWifiSettingsButton=new Button(x-width/12, y+height/6, width/20, color(10, 10, 100), color(200), null, 0, true, false, "save");
  recallWifiSettingsButton=new Button(x, y+height/6, width/20, color(10, 100, 10), color(200), null, 0, true, false, "recall");
  loadWifiHotspotSettingsButton=new Button(x+width/12, y+height/6, width/20, color(70, 5, 70), color(200), null, 0, true, false, "hotspot");
}
void runWifiSettingsChanger() {
  wifiIP=ipWifiSettingsTypeBox.run(wifiIP);
  wifiPort=portWifiSettingsTypeBox.run(wifiPort);
  saveWifiSettingsButton.run();
  recallWifiSettingsButton.run();
  loadWifiHotspotSettingsButton.run();
  if (saveWifiSettingsButton.justPressed()) {
    String[] settings={wifiIP, str(wifiPort)};
    saveStrings("data/wifiSettings", settings);
  }
  if (recallWifiSettingsButton.justPressed()) {
    try {
      String[] settings=loadStrings("data/wifiSettings");
      wifiIP=settings[0];
      wifiPort=int(settings[1]);
    }
    catch(Exception e) {
    }
  }
  if (loadWifiHotspotSettingsButton.justPressed()) {
    wifiPort=25210;
    wifiIP="10.25.21.1";
  }
}
