KeyboardCtrl keyboardCtrl; 
import java.util.HashSet; 
boolean keyPressTypeBox=false;
class KeyboardCtrl {
  HashSet<Integer> keys;
  KeyboardCtrl() {
    keys=new HashSet<Integer>();
  }
  boolean isPressed(int k) {
    return keys.contains(k);
  }
  PVector joystick(PVector v, int upKey, int downKey, int leftKey, int rightKey) {
    if (this.isPressed(upKey)) {
      v.set(v.x, 1);
    }
    if (this.isPressed(downKey)) {
      v.set(v.x, -1);
    }
    if (this.isPressed(leftKey)) {
      v.set(-1, v.y);
    }
    if (this.isPressed(rightKey)) {
      v.set(1, v.y);
    }
    return v;
  }
  float slider(float v, int pKey, int mKey) {
    if (this.isPressed(pKey)) {
      v=1;
    }
    if (this.isPressed(mKey)) {
      v=-1;
    }
    return v;
  }
  void keypress() {
    if (key==CODED) {
      keys.add(int(keyCode));
    } else {
      keys.add(int(key));
    }
  }
  void keyrelease() {
    if (key==CODED) {
      keys.remove(int(keyCode));
    } else {
      keys.remove(int(key));
    }
  }
}
void keyPressed() {
  if (!typeBoxActive)  
    keyboardCtrl.keypress(); 
  else  
  keyPressTypeBox=true;
}
void keyReleased() { 
  if (!typeBoxActive)  
    keyboardCtrl.keyrelease();
} 
