- https://www.gnu.org/software/libc/manual/html_node/Locale-Names.html - describes locale name format
- https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/
  - THE primer for understanding encodings
- https://kunststube.net/encoding/ - a explores the ideas in the primer more thoroughly
# Background
- Unfortunately, people tend to mix up defintions of words related to text encoding. The definitions provided here are what I'm sticking to based on
  my sources
## Character set
- A "character set" is composed of two things: (1) a set of letters (i.e. unique symbols) and (2) a mapping from each letter to an integer called a
  "code point"
  - E.g. Unicode _is_ a character set!
- The character set does not know or care how the code points will be represented in binary. That mapping is left up to an encoding
- The third source actually says that "character set" is synonymous with "encoding" itself! Ugh
## Encoding
- An "encoding" is a mapping between code points _in a character set_ and how they are represented in binary
  - E.g. UTF-8 is a multi-byte encoding that maps Unicode code points 0-127 to a single byte, and code points 128 and above to two or more bytes
    bytes
  - E.g. ISO-8859-1 (a.k.a. Latin-1) is a single-byte encoding that can represent Unicode code points 0-255
    - Confusingly, ISO-8859-1 _also_ appears to be the name of the associated character set! I'm sure this is quite common
  - Nowadays, that character set seems to implicitly always be Unicode
### Codeset
- Nowhere online really explains what this term means
- I'm going to choose to interpret this term as being synonymous with "encoding," because that's the only way it makes sense
### Charmap
- This is also synonymous with "encoding"
# Purpose
- A locale name is a label for all of the underlying locale configurations that are associated with it
# Format
```
language[_territory[.encoding]][@modifier]
```
- Most locale names follow "XPG syntax" and consist of up to four parts, though only the \<language> component is mandatory
- The most specificly named locale (i.e. the locale with the most parts) will be searched for first. If it cannot be found, less-specific locale names
  will be searched for by stripping off the following parts in order:
  1. Encoding
      - E.g. UTF-8
  2. Normalized encoding
      - E.g. I think that utf8 is a normalized version of UTF-8?
  3. Territory
      - E.g. US
  4. Modifier
      - E.g. @euro
## Locale name search example
1. el_GR.UTF-8
  - This is the most specific encoding
2. el_GR@euro
  - Since this has a modifier, this is the next most specific encoding
3. el_GR 
  - This is the least specific encoding
### Locale names in configuration files
- The actual locale names in `/etc/locale.gen` are listed as follows:
  - el_GR.UTF-8 UTF-8
  - el_GR@euro ISO-8859-7
  - el_GR ISO-8859-7
- Now I understand that the reason the encoding is always listed after the locale name is so that there is no ambiguity about what the encoding of a
  locale name is
  - E.g. storing "el_GR" in `/etc/locale.gen` would be _correct_, but it would be confusing because the encoding wouldn't be explicitly listed. By
    putting the encoding as a redundant piece of information after the locale name, the configuration is more clear
