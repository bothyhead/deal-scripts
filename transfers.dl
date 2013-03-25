# script to generate hands suitable for transfers
# 30.jun.2010

source dd/lib.tcl

set minNT 12
set maxNT 14

main {

  set dealer $env(dealer)

  reject unless {[nt $dealer $minNT $maxNT]}
  accept if {[jacoby [partner $dealer] $minNT $maxNT]}

}


