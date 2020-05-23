boolean gamepadAvail=false;
import org.gamecontrolplus.*;
import net.java.games.input.*;
ControlIO control;
ControlDevice gpad;
void setupGamepad(String device) {
  gamepadAvail=true;
  try {
    control = ControlIO.getInstance(this);
    println(control.getDevices());
    gpad=control.getDevice(device);
    if (gpad == null) {
      gamepadAvail=false;
      return;
    }
  }
  catch(Exception e) {
    gamepadAvail=false;
    return;
  }
  catch(NoClassDefFoundError f) {
    gamepadAvail=false;
    return;
  }
  catch(ExceptionInInitializerError g) {
    gamepadAvail=false;
    return;
  }
}
PVector gamepadVect(String xa, String ya, PVector v) {
  if (gamepadAvail&&xa!=null&&ya!=null) {
    try {
      return new PVector(gpad.getSlider(xa).getValue(), -gpad.getSlider(ya).getValue());
    }
    catch(NullPointerException n) {
      gamepadAvail=false;
      return v;
    }
  } else {
    return v;
  }
}
float gamepadVal(String a, float v) {
  if (gamepadAvail&&a!=null) {
    try {
      return gpad.getSlider(a).getValue();
    }
    catch(NullPointerException n) {
      gamepadAvail=false;
      return v;
    }
  } else {
    return v;
  }
}
boolean gamepadButton(String b, boolean v) {
  if (gamepadAvail&&b!=null) {
    try {
      return gpad.getButton(b).pressed();
    }
    catch(NullPointerException n) {
      gamepadAvail=false;
      return v;
    }
  } else {
    return v;
  }
}
