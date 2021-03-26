- https://unix.stackexchange.com/questions/49650/how-to-get-keycodes-for-xmodmap
- http://www.fascinatingcaptain.com/projects/remap-keyboard-keys-for-ubuntu/
# Examples
## Remap right windows key to right alt
### Files
#### /usr/share/X11/xkb/symbols/pc
##### Original mapping
```
key <RWIN> {        [ Super_R               ]       };

replace key <RALT> { [ Control_R, Control_R ] };

```
- The right windows key performs the Super_R function

##### Modified mapping
```
replace key <RWIN> { [ Alt_R, Meta_R ] };
```
- The right windows key now performs the Alt_R and Meta_R functions

## Swap left control and left alt
### Files
#### /usr/share/X11/xkb/symbols/pc
##### Original mapping
```
```
- x
##### Modified mapping
```
replace key <LALT> { [ Control_L, Control_L ] }; 
replace key <LCTL> { [ Alt_L, Meta_L ] };
```
- The left alt key now performs the Control_L function
- The left control key now performs the  Alt_L and Meta_L function


- x


- Known xmodmap keycodes:
  - 64: the button to the immediate left of my spacebar
      - Typically, that would be "Alt_L" but I've mapped it to "Control_L"
  - 37: the button in the bottom left corner of the keyboard
      - Typically, that would be "Control_L", but I've mapped it to "Alt_L" 
- Just look at /usr/share/X11/xkb/symbols/pc and modify it as shown below:

// Swap left alt and left ctrl (Austin)
replace key <LALT> { [ Control_L, Control_L ] };
replace key <LCTL> { [ Alt_L, Meta_L ] };
modifier_map Mod1    { <LCTL> };
modifier_map Control { <LALT> };

// Turn right alt into right ctrl
replace key <RALT> { [ Control_R, Control_R ] };
modifier_map Control { <RALT> };

//Original mapping (Austin)
//key <BKSP> {	[ BackSpace, BackSpace	]	};
// My mapping
key <BKSP> {	[ Caps_Lock		]	};

key  <TAB> {	[ Tab,	ISO_Left_Tab	]	};
key <RTRN> {	[ Return		]	};

// Original mapping (Austin)
//key <CAPS> {	[ Caps_Lock		]	};
// My mapping
key <CAPS> {	[ BackSpace, Backspace	]	};
