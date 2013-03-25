# Evaluating how often 3NT makes opposite a strong NT

set stats(dealCount) 0
set stats(ntMaking) 0

east is "KQ54 5432 32 432"

source dd/lib.tcl

main {
  reject unless [nt west 20 22]
  accept
}	       

proc write_deal {} {
  global stats
  incr stats(dealCount)
  if {[::deal::tricks west notrump] >= 9} {incr stats(ntMaking)}
}

proc flush_deal {} {
  global stats
  puts ""
  puts "3NT makes [expr 100 * $stats(ntMaking) / $stats(dealCount)]% of the time"
}
