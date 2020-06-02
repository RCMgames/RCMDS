static final boolean turningOffJoystick=false; //put turning on a separate slider instead of the joystick
/////////////////////////add interface elements here
Joystick movStick;
Slider turnSlider;
Slider serASlider;
Slider serBSlider;
Button serALowButton;
Button serBLowButton;
Button serAHighButton;
Button serBHighButton;
//////////////////////
float batVolt=0.0;
boolean enabled=false;
////////////////////////add variables here
PVector movement=new PVector(0, 0);
float turn=0.0;
float serA=0.0;
float serB=0.0;
void setup() {
  fullScreen();
  rcmdsSetup();
  //setup UI here 
  serALowButton=new Button(width*.06, height*.85, height*.1, color(100, 0, 0), color(255), null, 0, true, false, "");
  serAHighButton=new Button(width*.06, height*.65, height*.1, color(100, 0, 0), color(255), null, 0, true, false, "");
  serBLowButton=new Button(width*.26, height*.85, height*.1, color(0, 0, 100), color(255), null, 0, true, false, "");
  serBHighButton=new Button(width*.26, height*.65, height*.1, color(0, 0, 100), color(255), null, 0, true, false, "");
  movStick=new Joystick(width*.8, height*.5, width*.3, 1, 1, color(0, 100, 0), color(255), null, null, 0, 0, 0, 0, 0, 0);
  turnSlider=new Slider(width*.18, height*.4, width*.3, height*.1, -1, 1, color(0, 100, 0), color(255), null, 0, 0, 1, 0, true, false);
  serASlider=new Slider(width*.12, height*.75, height*.45, width*.05, -1, 1, color(100, 0, 0), color(255), null, 0, 0, .03, 0, false, false);
  serBSlider=new Slider(width*.2, height*.75, height*.45, width*.05, -1, 1, color(0, 0, 100), color(255), null, 0, 0, .03, 0, false, false);
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=runEnableSwitch(enabled);
  /////////////////////////////////////add UI here
  movement=movStick.run(new PVector(0, 0));
  turn=turnSlider.run(0);
  serA=serASlider.run(serA);
  serB=serBSlider.run(serB);
  if (serALowButton.run()) serA=-1;
  if (serAHighButton.run()) serA=.85;
  if (serBLowButton.run()) serB=-.8;
  if (serBHighButton.run()) serB=1;

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
  if (!turningOffJoystick) {
    sendVect(movement);
    sendFl(0);
  } else {
    sendFl(turn);
    sendFl(movement.y);
    sendFl(movement.x);
  }
  sendFl(serA);
  sendFl(serB);
}
