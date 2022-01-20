JUMP TO LAST OCCURRENCE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

The |f|{char}, F, t and T family of motions are often more effective
than the more general l, w and W motions. However, there are situations
where they are difficult to apply.
Take a long file system path like /var/opt/foo/a/very/long/path/to/filename.
Imagine you are on the beginning / and want to change the entire directory
path, but keep the filename. You'd either have to count occurrences (e.g. c8f/
or c2tf), do multiple moves ($T/cB), use visual mode (veeeeeeeelc), or a
search (c/filen&lt;CR&gt;).

This plugin extends the built-in f/F/t/T motions with counterparts that move
to the last occurrence of {char} in the line. For the above example, that
would be a short c,f/ to jump to the last slash in the line.

### SEE ALSO

- The JumpToVerticalOccurrence.vim plugin ([vimscript #4841](http://www.vim.org/scripts/script.php?script_id=4841)) implements
  variations of f / F that move vertically across lines, restricted to the
  same screen column as the cursor.

USAGE
------------------------------------------------------------------------------

    ,f{char}                To [count]'th occurrence of {char}, counting from the
                            end of the line. The cursor is placed on {char}
                            inclusive.
    ,F{char}                To the [count]'th occurrence of {char}, counting from
                            the beginning of the line. The cursor is placed on
                            {char} exclusive.
    ,t{char}                Till before [count]'th occurrence of {char}, counting
                            from the end of the line. The cursor is placed on the
                            character left of {char} inclusive.
    ,T{char}                Till after [count]'th occurrence of {char}, counting
                            from the beginning of the line. The cursor is placed
                            on the character right of {char} exclusive.

                            All motions can be repeated with ; and ,. However,
                            the ,t and ,T motions will jump to, not until, the
                            next {char}.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-JumpToLastOccurrence
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim JumpToLastOccurrence*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.016 or
  higher.
- repeat.vim ([vimscript #2136](http://www.vim.org/scripts/script.php?script_id=2136)) plugin, version 1.1 or higher (optional)

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

By default, all mappings start with , (comma) as the map leader instead of
using &lt;Leader&gt;. I personally find the default &lt;Leader&gt; key too far off the
keyboard to be useful for custom motions (which also cannot be repeated via
the . (dot) command, so they should be very fast to type repeatedly), but
quite suitable for general, less frequently used custom mappings.
To avoid losing the (rarely used) , mapping (which repeats latest f, t, F or
T in opposite direction), you can remap it to ,,:

    nnoremap ,, ,
    xnoremap ,, ,
    onoremap ,, ,

If you don't agree with this and want all motions to start with &lt;Leader&gt; (or
any other key), you can do this (before sourcing the script):

    let g:JumpToLastOccurrence_Leader = '<Leader>'

If you want to use completely different or only a few of the mappings, map
your keys to the &lt;Plug&gt;JumpToLastOccurrence\_? mapping targets _before_
sourcing the script (e.g. in your vimrc).

LIMITATIONS
------------------------------------------------------------------------------

- The ,t and ,T motions will jump to, not until, the next {char}. There's no
  built-in Vim motion for that reverse movement, and overloading ; and , would
  be very complex and probably also necessitate overloading f/F/t/T.
- When there's no match, the operator-pending mappings aren't canceled. So,
  cfX does not go into insert mode when there's no "X" match, but c,fX does.
- The operator-pending mode mappings don't work properly when the char at the
  end of the buffer is matched; the final character will remain, and a beep is
  issued. But one would probably use the much simpler $ motion in that case,
  anyway.

### TODO

- Handle digraphs via &lt;C-K&gt;.

### CONTRIBUTING

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-JumpToLastOccurrence/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.20    03-Apr-2014
- ENH: Implement repeat of operator-pending mapping without re-querying the
  {char}. This requires the repeat.vim plugin, version 1.1 or higher.
- Add dependency to ingo-library ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)).

__You need to separately
  install ingo-library ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)) version 1.016 (or higher)!__

##### 1.11    15-Sep-2012
- Also handle move to the buffer's very last character in operator-pending mode.

##### 1.10    30-Dec-2010
- Moved functions from plugin to separate autoload script.
- Made mappings configurable, both via the customary &lt;Plug&gt; mappings and
  alternatively in bulk through the g:JumpToLastOccurrence\_Leader setting.

##### 1.00    29-Dec-2010
- First published version.

##### 0.01    11-Dec-2010
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2010-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
