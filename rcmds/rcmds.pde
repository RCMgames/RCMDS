static final boolean joystickOnRight=false; //rotate on left, movement on right
/////////////////////////add interface elements here
Joystick movStick;
Slider intakeSlider;
Slider flywheelSlider;
Slider hoodSlider;
Button intakeLowButton;
Button intakeMidButton;
Button intakeHighButton;
Button laserButton;
//////////////////////
float batVolt=0.0;
boolean enabled=false;
////////////////////////add variables here
PVector movement=new PVector(0, 0);
float intake=0.0;
float flywheel=0.0;
float hood=0.0;
boolean laser=false;
void setup() {
  size(1920, 1080);
  rcmdsSetup();
  //setup UI here 
  intakeLowButton=new Button(width*.68, height*.85, height*.1, color(0, 100, 0), color(255), null, 0, true, false, "");
  intakeHighButton=new Button(width*.68, height*.55, height*.1, color(0, 100, 0), color(255), null, 0, true, false, "");
  intakeMidButton=new Button(width*.68, height*.7, height*.1, color(0, 100, 0), color(255), null, 0, true, false, "");
  laserButton=new Button(width*.85, height*.25, height*.2, color(100, 0, 0), color(255, 100, 100), null, 0, false, false, "");
  movStick=new Joystick(width*.18, height*.5, width*.3, 1, 1, color(100), color(255), null, null, 'w', 'a', 's', 'd', 0, 0);
  intakeSlider=new Slider(width*.75, height*.7, height*.45, width*.05, -1, 1, color(0, 100, 0), color(255), null, 0, 0, .03, 0, false, false);
  flywheelSlider=new Slider(width*.85, height*.7, height*.45, width*.05, 0, 1, color(200, 50, 50), color(255), null, 0, 0, .03, 0, false, false);
  hoodSlider=new Slider(width*.95, height*.7, height*.45, width*.05, -1, 1, color(100, 0, 100), color(255), null, 0, 0, .03, 0, false, false);
}
void draw() {
  background(0);
  runWifiSettingsChanger();
  enabled=runEnableSwitch(enabled);
  /////////////////////////////////////add UI here
  movement=movStick.run(new PVector(0, 0));
  intake=intakeSlider.run(intake);
  flywheel=flywheelSlider.run(flywheel);
  hood=hoodSlider.run(hood);

  if (intakeLowButton.run()) {
    intake=-1;
  }
  if (intakeMidButton.run()) {
    intake=-.4;
  }
  if (intakeHighButton.run()) {
    intake=1;
  }
  laser=laserButton.run();

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
  sendVect(movement);
  sendFl(intake);
  sendFl(constrain(flywheel, 0, 1));
  sendFl(hood);
  sendBl(laser);
}
