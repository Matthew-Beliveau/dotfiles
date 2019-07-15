# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

#------------------------------------------------------------
# GCC internship aliases
#------------------------------------------------------------

alias gt='cd ~/src/gcc/gcc'
alias gtls='cd ~/src/gcc/libstdc++-v3'
alias gtt='cd ~/src/gcc/gcc/testsuite/g++.dg'
alias gtu='cd ~/svn/trunk/; svn up; cd gcc'
alias gb='cd ~/bld/trunk'
alias gbg='cd ~/bld/trunk/gcc'
alias mg='make CXXFLAGS=-g3'
alias gdba='gdb -q --args'

export MAKEFLAGS='-j4'

dgxx ()
{
    ( cd ~/bld/trunk/gcc;
    GXX_TESTSUITE_STDS=98,11,14,17,2a make check-c++ ${1:+RUNTESTFLAGS="$*"} )
}

dg ()
{
     ( cd ~/bld/trunk/gcc;
     make check-c ${1:+RUNTESTFLAGS="$*"} )
}

gcc_configure ()
{
  /home/mbeliveau/src/gcc/configure --enable-languages=c,c++ --enable-checking=yes -with-system-zlib --disable-bootstrap --disable-libvtv --disable-libcilkrts --disable-libitm --disable-libgomp --disable-libcc1 --disable-libstdcxx-pch --disable-libssp --disable-isl --disable-libmpx --disable-libsanitizer --disable-libquadmath --disable-libatomic
}
