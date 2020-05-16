# RCMDS
Control App for [RCM](https://github.com/mpyoutube/rcm)

Made with [Processing!](https://www.processing.org)


## UI element reference:
### Joystick
```
Joystick(xPos, yPos, size, xRange, yRange, background, stick, xa, ya, upKey, leftKey, downKey, rightKey, xTilt, yTilt)
```

xPos,yPos: screen coordinates for the center of the joystick

size: dimensions of the joystick, in pixels

xRange,yRange: range of output values

background, stick: colors of background and joystick

xa,ya: names of gamecontroller axes for controlling the joystick (or null for no gamepad control)

upKey,leftKey,downKey,rightKey: keys for keyboard control (use 0 for no keyboard control) enclose character in single qoutes like: 'a'

xTilt,yTilt: which tilt axes control each axis. options: TILT_X (steering wheel), TILT_Y (forward/back), (use 0 for no tilt control)

