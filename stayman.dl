# script to generate hands suitable for stayman
# 30.jun.2010

source dd/lib.tcl

set minNT 12
set maxNT 14

shapecond WeakTakeout {($s==4 && $h==4 && $d>=5) || ($s==5 && $h==4) || ($s==4 && $h==5)}
patterncond shape4333 {$l1==4 && $l2==3 && $l3==3 && $l4==3}
shapecond FourCardMajor {($s==4 && $h<5) || ($h==4 && $s<5)}

main {

  set dealer $env(dealer)
  set pard [partner $dealer]

  # dealer can open 1NT
  reject unless {[nt $dealer $minNT $maxNT]}

  # if responder is 4333 shape, it's better to play in no trumps
  reject if {[shape4333 $pard]}

  set hc_pard [hcp $pard]

  # partner either fits a weak takout or has a 4-card major
  if {$hc_pard < (25 - $maxNT)} {
    accept if {[WeakTakeout $pard]}
  } else {
    accept if {[FourCardMajor $pard]}
  }

  reject

}


