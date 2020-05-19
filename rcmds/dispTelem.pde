void dispTelem(String[] msg, String[] val, int x, int y, int w, int h, int ts) {
  pushStyle();
  textSize(ts);
  stroke(255);
  strokeWeight(1);
  fill(10);
  rect(x, y, w, h-1);
  fill(255);
  for (int i=0; i<msg.length; i++) {
    text(msg[i], x+5, (i+1)*h/(msg.length+1)+y-h/2, w*.95, 2*h/(msg.length+1));
    text(": "+val[i], x+5+constrain(textWidth(msg[i]+": "), 0, w*.95)/2, (i+1)*h/(msg.length+1)+y-h/2, w- textWidth(": "+msg[i]), 2*h/(msg.length+1));
  }
  popStyle();
}
