void dispTelem(String[] msg, String[] val, int x, int y, int w, int h, int ts) {
  pushStyle();
  textSize(ts);
  stroke(255);
  strokeWeight(1);
  fill(10);
  rect(x, y, w, h-1);
  fill(255);
  for (int i=0; i<msg.length; i++) {
    text(msg[i], x+w*.02, y-h/2+1.5*ts+3.5*i*ts, w*.94, ts*1.5);
    text(val[i], x+w*.02, y-h/2+3*ts+3.5*i*ts, w*.94, ts*1.5);
  }
  popStyle();
}
