TypeBox portWifiSettingsTypeBox;
TypeBox ipWifiSettingsTypeBox;
Button redSaveWifiButton;
Button redRecallWifiButton;
Button blueSaveWifiButton;
Button blueRecallWifiButton;
Button loadWifiHotspotSettingsButton;
void setupWifiSettingsChanger(float x, float y) {
  ipWifiSettingsTypeBox=new TypeBox(x, height/40+y, width/4, height/20, "ip: ", color(0, 255, 0));
  portWifiSettingsTypeBox=new TypeBox(x, 3*height/40+1+y, width/4, height/20, "port: ", color(0, 255, 0));
  redRecallWifiButton=new Button(x-width/12, y+height/6.5, height/10, color(150, 0, 0), color(200), null, 0, true, false, "recall");
  redSaveWifiButton=new Button(x-width/12, y+height/4, height/15, color(150, 0, 0), color(200), null, 0, true, false, "save");
  loadWifiHotspotSettingsButton=new Button(x, y+height/6, height/8, color(70, 5, 70), color(200), null, 0, true, false, "hotspot");
  blueRecallWifiButton=new Button(x+width/12, y+height/6.5, height/10, color(0, 0, 150), color(200), null, 0, true, false, "recall");
  blueSaveWifiButton=new Button(x+width/12, y+height/4, height/15, color(0, 0, 150), color(200), null, 0, true, false, "save");
}
void runWifiSettingsChanger() {
  wifiIP=ipWifiSettingsTypeBox.run(wifiIP);
  wifiPort=portWifiSettingsTypeBox.run(wifiPort);
  redRecallWifiButton.run();
  redSaveWifiButton.run();
  loadWifiHotspotSettingsButton.run();
  blueRecallWifiButton.run();
  blueSaveWifiButton.run();
  if (redSaveWifiButton.justPressed()) {
    String[] settings={wifiIP, str(wifiPort)};
    saveStrings("data/REDwifiSettings.txt", settings);
  }
  if (redRecallWifiButton.justPressed()) {
    try {
      String[] settings=loadStrings("data/REDwifiSettings.txt");
      wifiIP=settings[0];
      wifiPort=int(settings[1]);
    }
    catch(Exception e) {
    }
  }
  if (blueSaveWifiButton.justPressed()) {
    String[] settings={wifiIP, str(wifiPort)};
    saveStrings("data/BLUEwifiSettings.txt", settings);
  }
  if (blueRecallWifiButton.justPressed()) {
    try {
      String[] settings=loadStrings("data/BLUEwifiSettings.txt");
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
