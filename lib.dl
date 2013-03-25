#
# useful functions 
#
# 24.Mar.2013
#

source lib/utility.tcl

defvector weak2quality 2 2 2 1 1

patternfunc twoLongest {
  return $l1 + $l2
}


# accept once there is at least 1 5 card suit
proc jacoby {hand ntmin ntmax} {

  if {[spades $hand] < 5 && [hearts $hand] < 5 && [diamonds $hand] < 6 && [clubs $hand] < 6} {return 0}

  set pts [hcp $hand]
  set num_h [hearts $hand]
  set num_s [spades $hand]

  # ignore weak 5/4 hands, which are more suited to stayman
  if {($num_h == 5 && $num_s >=4 ) || ($num_s == 5 && $num_h >= 4)} {
    if {$pts < 25 - $ntmax} {return 0}
  }

  return 1

}

# a weak two consists of a 6-card suit and two of the top-3 hounours, or 3 of the top-5
proc weak2 {hand suit} {
  if {[$suit $hand] == 6 && [weak2quality $hand $suit] >=4} { return 1 }
  return 0
}

# rule of 20
proc ruleOf20 {hand} {

  set points [hcp $hand]

  if {$points >= 12} {return 1}
  if {($points + [twoLongest $hand]) >= 20 } {return 1}

  return 0

}

# suit quality test for overcalls
holdingProc SuitQuality {len A K Q J T} {

   set HigherHonors [expr {$A+$K+$Q+$J}]

   set Quality [expr {$len + $HigherHonors}]

   if {$T && ($HigherHonors >= 2)} {incr Quality}

   return $Quality
}
 
# return the number of playing tricks
# calculated as (13 - loosers)
proc playingTricks {hand} {
  return [expr {13 - ([losers $hand] / 2)}]
}
