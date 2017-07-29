" Common preparations for running tests.

" Make sure 'runtimepath' and 'packpath' does not include $HOME.
set rtp=$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
if has('packages')
  let &packpath = &rtp
endif

" Only when the +eval feature is present. 
if 1
  " Make sure the .Xauthority file can be found after changing $HOME.
  if $XAUTHORITY == ''
    let $XAUTHORITY = $HOME . '/.Xauthority'
  endif

  " Make sure $HOME does not get read or written.
  " It must exist, gnome tries to create $HOME/.gnome2
  let $HOME = getcwd() . '/XfakeHOME'
  call mkdir($HOME)
endif
