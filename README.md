# RCMDS
Control App for [RCM](https://github.com/mpyoutube/rcm)

Made with [Processing!](https://www.processing.org/reference)


## UI element reference:
### Joystick
A Joystick is a two axis control.
```
Joystick(xPos, yPos, size, xRange, yRange, background, stick, xa, ya, upKey, leftKey, downKey, rightKey, xTilt, yTilt)
```

xPos,yPos: screen coordinates for the center of the joystick (float)

size: dimensions of the joystick, in pixels (float)

xRange,yRange: range of output values (float)

background, stick: colors of background and joystick (color)

xa,ya: names of gamecontroller axes for controlling the joystick (or null for no gamepad control), put in "double quotes" (String)

upKey,leftKey,downKey,rightKey: keys for keyboard control (use 0 for no keyboard control) enclose key character in single qoutes like: 'a'

xTilt,yTilt: which tilt axes control each axis. options: TILT_X (steering wheel), TILT_Y (forward/back), 0 for no tilt control

```
outVector=myJoystick.run(inVector)
```

myJoystick: an instance of Joystick

outVector: of type PVector, outVector.x,outVector.y accesses the x and y components of the joystick control

inVector: where the joystick should snap to if there is no input. new PVector(0,0) makes it return to center, the last outVector makes it stay where you put it.

### Slider
A Slider is a one axis control.
```
  Slider(xPos, yPos, size, width, range, background, stick, ga, pKey, mKey, inc, tilt, horizontal, reverse)
```

xPos,yPos: screen coordinates for the center of the slider (float)

size: how long the slider is (float)

width: how wide the slider is (float)

range: range of output values (float)

background: color of slider background (color)

stick: color of slider handle (color)

ga: name of gamecontroller axis for controlling the slider (or null for no gamepad control), put in "double quotes" (String)

pKey, mKey: +,- keys for keyboard control (use 0 for no keyboard control) enclose key character in single qoutes like: 'a'

inc: value to increment by for keyboard control, 1=jump from center to end immediately (float)

tilt: which tilt axis controls the slider. options: TILT_X (steering wheel), TILT_Y (forward/back), 0 for no tilt control

horizontal: true if horizontal slider wanted, false for vertical

reverse: true = make down or left be positive, false =  up or right is positive

```
outValue=mySlider.run(inValue)
```
mySlider: an instance of Slider

outValue: of type float, the output of the Slider control

inValue: where the slider should snap to if there is no input, 0 makes it snap to center, the last outValue makes it stay wherever you put it

### Button
A Button is a two state control.
```
  Button(xPos, yPos, size, background, forground, gpButton, keyboard, momentary, val, label) {
```
xPos,yPos: screen coordinates for the center of the slider (float)

size: dimensions of the button, in pixels (float)

background: color when off (color)

forground: color when on (color)

gpButton: name of gamecontroller button for controlling the button (or null for no gamepad control), put in "double quotes" (String)

keyboard: key for keyboard control (use 0 for no keyboard control) enclose key character in single quotes like: 'a'

momentary: true=momentary button, false=toggle button

val: what state a toggle button should start in (boolean)

label: text label to be displayed on the button (string)

```
val=myButton.run();
```
myButton: an instance of Button

The run function is necessary to make a button show up and operate

val: if the button is on (either latched into the on state in toggle mode, or currently pressed in momentary mode) (boolean)

```
myButton.justPressed()
```
returns true once when the button was just pressed (boolean)

```
myButton.justReleased()
```
returns true once when the button was just released (boolean)

```
myButton.toggledOff()
```
returns true once when the button's state switches to off (boolean)

```
myButton.toggledOn()
```
returns true once when the button's state switches to on (boolean)
