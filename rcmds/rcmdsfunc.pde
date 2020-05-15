void rcmdsSetup() {
  orientation(LANDSCAPE);
  shapeMode(CENTER);
  rectMode(CENTER);
  background(0);
  udp = new UDP(this);
  udp.listen(true);
}
boolean runEnableSwitch(boolean en){
 return en; 
}
