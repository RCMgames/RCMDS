//remove for Java mode
import ketai.sensors.*;
KetaiSensor sensor;
boolean accelerometerAvail=false;
float oriXRead, oriYRead, oriZRead;
void setupAccelerometer() {
  try {
    sensor = new KetaiSensor(this);
    sensor.start();
    accelerometerAvail=true;
  }
  catch(NoClassDefFoundError e) {
    accelerometerAvail=false;
  }
}
PVector readTip(PVector v) {
  if (accelerometerAvail) {
    return new PVector(constrain(map(oriYRead, -7, 7, -1, 1), -1, 1), constrain(map(oriZRead, -6, 6, -1, 1), -1, 1));
  } else {
    return v;
  }
}
void onGravityEvent(float x, float y, float z) {
  oriXRead = x;
  oriYRead = y;
  oriZRead = z;
}
