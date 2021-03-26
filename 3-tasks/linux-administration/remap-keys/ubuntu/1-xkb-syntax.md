- https://www.x.org/releases/X11R7.7/doc/kbproto/xkbproto.html - xkb protocol
- http://www.fascinatingcaptain.com/projects/remap-keyboard-keys-for-ubuntu/
# Examples
## Map key to virtual modifier and virtual modifier to real modifier
### Files
#### /usr/share/X11/xkb/symbols/pc
```
key <LCTL> {        [ Control_L             ]       };
modifier_map Control{ Control_L, Control_R };
```
- The first line maps the physical "\<LCTRL>" key to the virtual modifier "Control_L"
  - All I understand is that a virtual modifier isn't "real," so it needs to be mapped to a real modifier
  - These virtual modifiers could still have meaning in the OS somehow 
    - All of my OS keyboard shortcuts use real modifiers, not virtual modifiers, so I don't have an example
- The second line maps the virtual modifier "Control_L" to the real modifier "Control"
## Remap left control to be left alt
### Files
#### /usr/share/X11/xkb/symbols/pc
```
replace key <LCTL> { [ Alt_L, Meta_L ] };
```
- This is all that is needed to make the left control key behave like the left alt key 