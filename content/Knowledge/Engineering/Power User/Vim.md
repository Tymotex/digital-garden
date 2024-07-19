---
title: Vim
---

Things I should utilise more:
- `;` and `,` to repeat the last motion forwards and backwards respectively.
	- E.g. `t_` to jump to next underscore, then press `;` to keep going to the next underscore after that.

## Highlights
```python
# ═════ Operators ═════
C             # Delete until the end of the line
.             # Repeats the last command that modified the text buffer.

# ═════ Motions ═════
%                 # Jump to matching {} () character

{c|d}t<char>      # Delete up to the first occurrence of char
{c|d}f<char>      # Delete up to and including the first occurrence of char

d/<str>           # Delete until the first occurrence of str

# ═════ Text Objects ═════
{operator}{a|i}w    # Words
		ciw             # Delete current word
{operator}{a|i}"
		ci"             # Delete contents of quoted string "..."
{operator}{a|i}t    # HTML tags
		dit             # Delete an HTML element's contents
		dat             # Delete an entire HTML element
{operator}{a|i}b    # ( ... )
		cib             # Delete all code in this ( block
{operator}{a|i}B    # { ... }
		ciB             # Delete all code in this { block

# ═════ Transformations ═════
u             # Lowercase highlighted text
U             # Uppercase highlighted text
gq<enter>     # If a given line exceeds 80 characters, then reformat it automatically

# ═════ ... ═════
gi             # Drops you back to where you were last in insert mode
<n>g;          # Drops you back to where you made the last n-th edit.

# ═════ Vim Surround ═════
cs'"          # Changes single quotes to double quotes
Sb            # Surrounds highlighted text with ()
SB            # Surrounds highlighted text with {}
dst           # Deletes surrounding HTML tags
```

## Vim Basics
Vim exists in 3 modes at any given time:
1. *Normal mode* — navigation and editing.
2. *Insert mode* — typing characters directly.
3. *Visual mode* — making visual selections of text.
---
- Saving and quitting
    ```bash
    :q     # Quit
    :w     # Save changes
    
    :wq    # Write the bytes into the file and quit
    :q!    # Force quit, losing unsaved changes
    ```
- Inserting, deleting, replacing
    **Insert mode:**
    ```bash
    i   # Enter insert mode
    I   # Enter insert mode at the very start of this line
    a   # Enter insert mode one character after the cursor
    A   # Enter insert mode at the very end of this line
    o   # Inserts a new line below and puts you in insert mode
    O   # Inserts a new line above and puts you in insert mode
    ```
    **Deleting:**
    ```bash
    dd   # Deletes the current line
    D    # Deletes everything past the right of the cursor
    ```
    **Replacing:**
    ```bash
    cw   # 'Change word'. This deletes the current word and puts you in insert mode
    
    R    # Enters replace mode
    ```
- Undo and redo
    ```bash
    u         # Undo last change
    ctrl + r  # Redo last change
    ```
- Copy and paste
    ```bash
    yy   # Copies/'yanks' the current line to the clipboard
    p    # Pastes the line below the current line
    ```
- Zoom and view
    ```bash
    ctrl + +  # Zoom in
    ctrl + -  # Zoom out
    
    zz        # Recenter the viewpane around the current cursor location 
    ```
- Visual mode: lets you visually confirm what lines of text you intend to manipulate.
    `ctrl+v` to enter visual mode. You can use any navigation command availabe in command mode within visual mode, eg. `h, j, k, l` for navigation, `{`, `}` for skipping code blocks.
    ```bash
    V         # Select entire lines
    ```
- Misc. — other helpful keys
    ```bash
    .    # Repeats the last command used. Super powerful
    
    u    # Lowercase the selected text
    U    # Uppercase the selected text
    ```
- Macros
    ```bash
    q <char>  # Starts recording a macro on a specified character
    @ <char>  # Plays the macro on a specified character
    ```
- Registers
    ```bash
    :reg     # Views the contents of registers
    ```
- Scrolling
    ```python
    # Vertical scrolling
    ctrl + y    # 1 line UP
    ctrl + e    # 1 line DOWN
    
    ctrl + u    # 1/2 screen UP
    ctrl + d    # 1/2 screen DOWN
    
    ctrl + b    # One full screen UP
    ctrl + f    # One full screen DOWN
    
    # Horizontal scrolling
    zH          # Half a screen width to the left    (remember that 'h' goes left in normal Vim navigation)
    zL          # Half a screen width to the right   (remember that 'l' goes right in normal Vim navigation)
    ```

### Motions
Motions are movement commands for moving the cursor to different positions.
- You can use operators with motions: $\texttt{\{operator\}\{count\}\{motion\}}$. For example, `d3j`.
- You can repeat motions: $\texttt{\{count\}\{motion\}}$. For example, `5k`.

```bash
# Commonly used commands are bolded and highlighted

**# ------------------------------- Basic Motions ------------------------------ #**
**h**      ←
**j**      ↑
**k**      ↓
**l**      →

**# -------------------------------- Word Motions ------------------------------ #**
# A ***word*** in Vim is a sequence of alphanumeric characters OR a sequence of 
# non-whitespace characters
#     Eg. These are considered as **single** words: 
#           *word*
#           *asdf1234*
#           *,,,*
#           *......*
#           *././%*
# A ***WORD*** in Vim is a sequence of non-whitespace characters
#     Eg. These are considered as **single** WORDs: 
#           *myFunc()*
#           *[1,2,3]*

**w**     # Move to the **beginning of the next** **word**
**b**     # Move to the **beginning of the previous word**
      # (***b***ack)
**e**     # Move to the **last** character of the **current or next word**
      # (***e***nd)

**# WORD equivalents:**
**W     
B    
E**

**# ---------------------------------- Jumping --------------------------------- #
# Forward Jumping:**
**f <char>**    # Move to the **first occurrence** of **<char>** in the current line
            # (***f***ind)
**t <char>**    # Move to the character **before the first occurrence** of **<char>** in the current line
            # (un***t***il)

**;**           # Repeat the last character search (jump to next occurrence)

**# Backward Equivalents:**
**F <char>**    
**T <char>**

**,**           # Repeat the last character search (jump to previous occurrence)

**# ------------------------------- Line Motions ------------------------------- #**
**^**     # Move to the first non-whitespace character in this line
0     # Move to the absolute start of the line
$     # Move to the end of the line
**g_**    # Move to the last non-whitespace character in this line

%     # Moves to the corresponding parentheses, curly bracket or square bracket

G     # Move to the bottom of the file
gg    # Move to the top of the file

}     # Move past the next block of paragraph/code
{     # Move behind the previous block of paragraph/code

:<num>   # Move to a specified line number

*     # Moves to the next instance of the current word in this file. Useful for
      # finding where a function is called
```

### Text Objects
You can perform operations on common text objects that occur in code and prose. Format: $\texttt{\{operator\}\{a|i\}\{text-object-id\}}$, where:
- $\texttt{a}$ — apply the operator ‘around’ the text object.
- $\texttt{i}$ — apply the operator ‘inside’ the text object.
- $\texttt{text-object-id}$ includes:
	```
	w
	"
	'
	(
	```

### Yanking
`y` is an operator just like d, so you can use it in $\texttt{\{operator\}\{count\}\{motion\}}$. I prefer to yank visual mode selections instead since it gives me better confidence of precisely what I yanked.

**Registers:** Vim gives you a set of registers that you can yank text into. The operators `d` and `c` are actually cutting things, not deleting them. 
You save to a register by doing $\texttt{"\{register\}\{y|d|c\}\{motion\}}$ or if you use visual mode, then it’s $\texttt{"\{register\}\{y|d|c\}}$.
- `"` — this is where text gets yanked into by default (when you don’t specify a register).
- `a-z` — general-purpose registers you can yank text into explicitly.
- `1-9` — stores the last 9 things you cut.
- `+` or `*` — system clipboard. I prefer to override Vim to still use the classic ctrl+c and ctrl+v however.

You can also paste from a register while in *insert mode*: $\texttt{ctrl+r <register>}$. For example, $\texttt{ctrl+r "}$ inserts whatever is in register "

### Search
In normal mode:
- **Forward search:** `/<pattern>`
- **Backward search:** `?<pattern>`

Press `n` to see the next occurrence, or `N` for previous occurrrence.

### Command-Line Mode
There are a lot ex commands that you can invoke with : in normal mode. Note: the VSCodeVim extension has a limited set of ex commands.
```sh
:[range]s/pattern/replacement/<flags>   # sed substitution with regex pattern matching.
    :s///                               # Find and replace first occurrence in the current line.
    :s///g                              # Find and replace all occurrences in the current line.
	:% s///g                            # Find and replace all occurrences in the file.
                                        # Note: you can set the % range to be default since it's so commonly used.

:<line_num>              # Jump to specific line number.

:edit <relative_path>    # Opens a new file for editing at the relative path from the currently open file. 
                         # Useful for quickly creating files in the same directory (or nearby) as the current file.
:e <relative_path>       # Shorthand.

```

Some ex commands can be applied over a range of lines. Format: $\texttt{[range]command [options]}$.
```python
:d a        # Deletes the current line and stores it in register a.
:5,8d a     # Deletes lines 5, 6, 7, 8 and stores them in register a.
:5,3+d a    # Same as above but uses a 'run length' of 3 lines.
:.,3+d a    # Deletes this line and the next 2.
:.,$d a     # Deletes everything from this line to the end of the file.
:%d a       # Deletes the entire file.
```
Ranged ex commands are sometimes faster than if you were to navigate the cursor to the right positions before executing some command.

### Marks
Often you are at, say, line 123 and want to check line 321, then go back to line 123. A good way to do this is to use marks.

`m <letter>` — assigns a letter to the current line number.
- `ma` marks the current line as 'mark a'.
- `'a` jumps to 'mark a'.

`:marks` lists all marks.

### Combos
A collection of frequently used combos.

**Deletion/Edit combos:**
```bash
d }         # Deletes the next code block
d w         # Deletes the next word
d t <char>  # Deletes everything up to the specified character 

d <line> gg # Deletes everything up a specified line number
```

In general, `d` can be combined with any navigation command.
- `vi(` — highlight all code between the current pair of parentheses. Works across multiple lines
- `ci(` — delete everything between current pair of parentheses and go into insert mode
    - Works for all types of 'container' characters (eg. `ci{`, `ci[`, `ci<`, `ci"`)
- `c%` — the % motion finds the next open parenthesis and jumps to its matching parenthesis
	![[Knowledge/Engineering/Power User/assets/vim-character-markers.png|600]]
    - Everything between ^ and B are deleted
    - `%` also works for [, {, <, etc.

**Word operations:**
- `caw` — delete the current word and go into insert mode. Remember `caw == "change a word"`
    - `ciw` — I tend to use this one more
    - `ciW` — deletes the entire word you're on but a 'word' is delimited by whitespace characters rather than by punctuation characters like by default
- `ea` — jump to the end of the current word and go into insert mode

**Next occurrence:**
- `dt<char>` — deletes everything up to a particular character in the forward direction
    - `dT<char>` — in the backward direction

**Copy and paste:**
- `yaw` — yanks the current word. Remember `yaw == "yank a word"`

**Indenting:**
1. Highlight the block of code in visual mode
2. `>` to indent forward or `<` to indent backwards
3. `gv>` to continue indenting the same block forward. Use `.` to repeat this and `u` to undo
`gv<` for indenting backwards 

**Visual mode:**
- `gv` — highlights the last highlighted block of code
- `o` — toggles the cursor between the top and bottom of the selected code
- `<num>G` — highlights up to the specified line number

**Tab changing:**
- `gt` — next tab
- `gT` — previous tab
- `<num>gt` — jump to numbered tab

## Themes
To add a new theme:
1. `mkdir ~/.vim`
2. `git clone $THEME_GIT_REPO ~/.vim`
3. Then in `.vimrc` add the line: `colorscheme $THEME_NAME`.

## Plugins
Note: the [VSCodeVim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim) extension ships with some of the most useful Vim plugins built-in. Eg. [Vim Surround](https://github.com/tpope/vim-surround).

### Vim Surround
Provides operations for affecting enclosing characters such as `(, [, <, {, <p>`, etc.
- Delete surroundings: $\texttt{ds\{char\}}$
- Change surroundings: $\texttt{cs\{old\_char\}\{new\_char\}}$
- Surround currently highlighted: $\texttt{S\{char\}}$
```
ds<char>       # Removes the enclosing character specified
	dsb        # Deletes surrounding ()
    ds'        # Deletes surround ''
	dst        # Deletes the surrounding HTML tags

cs<old><new>   # Swaps the old enclosing character to a new enclosing character
	Eg. cs'`   # Changes 'hello' to `hello`
	cs[{       # Changes [hello] to {hello}
	cst"       # Changes <tag>hello</tag> to "hello" 

S<char>        # Surround the currently highlighted text with the given character.
	Eg. Sb     # Surround with (). Same as S(   
	SB         # Surround with {}. Same as S}
	S"         # Surround with "" 
	Stli>      # Surround with <li>
```
