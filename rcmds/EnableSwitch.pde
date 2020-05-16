class EnableSwitch {
  float x;
  float y;
  float w;
  float h;
  float sliderPos;
  boolean locked=true;
  int pointerID;

  EnableSwitch(float _x, float _y, float _w, float _h) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    pointerID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    //pointerID=mousescreen.registerZone(x, y, w, h);//remove for Android mode
    sliderPos=1;
  }
  boolean run(boolean enabled) {
    stroke(255);
    noFill();
    rect(x, y, w, h);
    //float swipePos=mousescreen.readPos(pointerID, new PVector(1, 0)).x;//remove for Android mode
    float swipePos=touchscreen.readPos(pointerID, new PVector(1, 0)).x;//remove for Java mode
    swipePos=constrain(swipePos, -1, 1);
    if (enabled) {
      //boolean pressed=mousescreen.readPressed(pointerID);//remove for Android mode
      boolean pressed=touchscreen.readPressed(pointerID);//remove for Java mode
      if (pressed&&!locked) {
        enabled=false;
        locked=true;
      }
      if (!pressed) {
        locked=false;
      }
      fill(255, 0, 0);
      rect(x, y, w, h);
      fill(255);
      textSize(h/3);
      text("DISABLE", x, y+h/3, w, h);
    } else { //disabled
      if (locked&&swipePos<1&&swipePos>1-2*h/w) {
        locked=false;
      }
      if (swipePos==1) {
        locked=true;
      }
      noStroke();
      fill(0, 100, 0);
      rect(x, y, w, h);
      fill(255);
      textSize(h/3);
      text("enable <-", x, y+h/3, w, h);
      if (locked) {
        fill(0, 255, 0);      
        rect(x+w/2-h/2, y, h, h);
      } else {
        rectMode(CORNERS);
        fill(255, 0, 0);
        rect(x+w/2, y-w/2, w/2+constrain(w/2*swipePos, -w/2+h/2, w/2-h/2), h);
        rectMode(CENTER);        
        fill(255, 255, 0);
        rect(x+constrain(w/2*swipePos, -w/2+h/2, w/2-h/2), y, h, h);
      }
      if (swipePos<=-1+h/w&&!locked) {
        locked=true;
        enabled=true;
      }
    }
    return enabled;
  }
}
