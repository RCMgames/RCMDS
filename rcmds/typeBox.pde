import ketai.ui.*;
boolean typeBoxActive=false;
class TypeBox {
  float x;
  float y;
  float w;
  float h;
  String label;
  int touchID;
  int mouseID;
  boolean e;
  boolean le;
  String entry;
  color col;
  TypeBox(float _x, float _y, float _w, float _h, String _label, color _col) {
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    label=_label;
    e=false;
    le=false;
    col=_col;
    //touchID=touchscreen.registerZone(xPos, yPos, size, size);//remove for Java mode
    mouseID=mousescreen.registerZone(x, y, w, h);//remove for Android mode
  }
  void doCommon(int numMode) {
    le=e;
    if (keyPressed) {
      if (key==ENTER) {
        e=false;
        typeBoxActive=false;
      }
      if (key==DELETE) {
        e=false;
        entry="";
        typeBoxActive=false;
      }
    }
    if (
      mousescreen.readPressed(mouseID)//remove for Android mode
      //touchscreen.readPressed(touchID)//remove for Java mode
      &&!typeBoxActive) {
      e=true;
      typeBoxActive=true;
    }
    if (e&&!le) {//just activated
      entry="";
      //KetaiKeyboard.show(rcmds.this);//remove for Java mode
    }
    if (!e&&le) {//edit finished
      //KetaiKeyboard.hide(rcmds.this);//remove for Java mode
    }
    if (e) {
      if (keyPressTypeBox&&textWidth(entry)<w-2-textWidth(label)) {
        if (numMode==0&&(((key>=32&&key<=126)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key; //letters and numbers
        }
        if (numMode==1&&((key==45||(key>=48&&key<=57)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key;//numbers and negative
        }
        if (numMode==2&&((key==45||key==46||(key>=48&&key<=57)) && (key != CODED))) {        
          keyPressTypeBox=false;
          entry+=key;//numbers, negative, and decimal
        }
      }
      if (keyPressTypeBox&key==BACKSPACE&&entry.length()>0) {        
        keyPressTypeBox=false;
        entry=entry.substring(0, entry.length()-1);
      }
    }
    fill(0);
    if (e)stroke(255);
    else stroke(col);
    rect(x, y, w, h);
    if (e)fill(255);
    else fill(col);
    textSize(h*.75);
    text(label, x, y, w, h);
    if (e) {
      text(entry, x+textWidth(label)/2, y, w-textWidth(label), h);
    }
  }
  String run(String val) {
    doCommon(0);
    if (!e&&le) {//edit finished
      if (entry!="") {
        val=entry;
      }
    }
    if (!e) {
      text(val, x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    return val;
  }
  int run(int val) {
    doCommon(1);
    if (!e&&le) {//edit finished
      if (int(entry)==int(entry)&&entry!="") {
        val=int(entry);
      }
    }
    if (!e) {
      text(str(val), x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    return val;
  }
  float run(float val) {
    doCommon(2);
    if (!e&&le) {//edit finished
      if (float(entry)==float(entry)&&entry!="") {//NaN check
        val=float(entry);
      }
    }
    if (!e) {
      text(str(val), x+textWidth(label)/2, y, w-textWidth(label), h);
    }
    return val;
  }
}
