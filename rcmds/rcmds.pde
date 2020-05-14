int wifiPort=25210;
String wifiIP="73.37.49.126";
///////////////////////////////
Joystick stick1;
Joystick stick2;
Button b1;
Button b2;
Button b3;
boolean ledVal=false;
void setup() {
  //fullScreen();//remove for Java mode
  size(1920, 1080);//remove for Android mode
  rcmdsSetup();
  setupGamepad("Feather 32u4");//name of gamepad device, remove for Android mode
  //touchscreen=new Touchscreen();//remove for Java mode
  mousescreen=new Mousescreen();//remove for Android mode
  keyboardCtrl=new KeyboardCtrl();//remove for Android mode
  stick1=new Joystick(1500, 500, 500, 10, 20, color(255, 0, 0), color(255), "X Axis", "Y Axis", 'w', 'a', 's', 'd');
  stick2=new Joystick(500, 500, 500, 10, 20, color(0, 255, 0), color(255, 0, 255), null, null, UP, LEFT, DOWN, RIGHT);
  b1=new Button(1000, 100, 100, color(100), color(0, 200, 0), "Button 1", ' ', true, false);
  b2=new Button(1000, 300, 100, color(100), color(0, 200, 0), "Button 2", SHIFT, false, true);
  b3=new Button(1000, 500, 100, color(100), color(0, 200, 0), "Button 3", 0, false, false);
}
void draw() {
  background(0);
  ledVal=stick1.run(new PVector(0, -20)).y>=0;
  stick2.run(new PVector(0, 0));
  b1.run();
  b2.run();
  b3.run();
  mousePress=false;//remove for Android mode
  sendWifiData(true);
}
void WifiDataToParse() {//read data here
  parseIn();
}
void WifiDataToSend() {//send data here
  addBoolean(ledVal);
}
