Joystick stick1;
Joystick stick2;
void setup() {
  //fullScreen();//remove for Java mode
  size(2000, 800);//remove for Android mode
  rcmdsSetup();
  setupGamepad("Feather 32u4");//name of gamepad device
  //touchscreen=new Touchscreen();//remove for Java mode
  mousescreen=new Mousescreen();//remove for Android mode
  stick1=new Joystick(1500, 500, 500, 10, 20, color(255, 0, 0), color(255), "X Axis", "Y Axis");
  stick2=new Joystick(500, 500, 500, 10, 20, color(0, 255, 0), color(255, 0, 255), null, null);
}
void draw() {
  background(0);
  stick2.run(new PVector(0, -20));
  stick1.run(new PVector(0, 0));
  mousePress=false;//remove for Android mode
}
