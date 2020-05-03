//comment out all for Android mode
boolean gamepadAvail=false;
import org.gamecontrolplus.*;
import net.java.games.input.*;
ControlIO control;
ControlDevice gpad;
void setupGamepad(String device) {
  gamepadAvail=true;
  try {
    control = ControlIO.getInstance(this);
    gpad=control.getDevice(device);//your game controller
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
PVector gamepadVect(String xa, String ya) {
  if (gamepadAvail) {
    try {
      return new PVector(gpad.getSlider(xa).getValue(), -gpad.getSlider(ya).getValue());
    }
    catch(NullPointerException n) {
      gamepadAvail=false;
      return new PVector(0, 0);
    }
  } else {
    return new PVector(0, 0);
  }
}
