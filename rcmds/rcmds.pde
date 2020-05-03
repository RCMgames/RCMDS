Joystick stick1;
Joystick stick2;
void setup() {
  background(0);
  fullScreen();
  orientation(LANDSCAPE);
  shapeMode(CENTER);
  rectMode(CENTER);
  touchscreen=new Touchscreen();
  //mousescreen=new Mousescreen();
  stick1=new Joystick(1500, 500, 500, 10, 20, color(255, 0, 0), color(255));
  stick2=new Joystick(500, 500, 500, 10, 20, color(0, 255, 0), color(255, 0, 255));
}
void draw() {
  background(0);
  stick2.run(new PVector(0, 0));
  stick1.run(new PVector(0, 0));
  //mousePress=false;
}
