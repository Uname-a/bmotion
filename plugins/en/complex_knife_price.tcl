###############################################################################
# This is a bMotion plugin
# Copyright (C) Casey Bartlett 2015
#
# This program is covered by the GPL, please refer the to LICENCE file in the
# distribution; further information can be found in the headers of the scripts
# in the modules directory.
###############################################################################

bMotion_plugin_add_complex "knife_price" "%botnicks,?:? (knife) (price|cost|value) (of) (.+)" 100 bMotion_plugin_complex_knife_price "en"

proc bMotion_plugin_complex_knife_price { nick host handle channel text } {
  global botnicks
  if {[regexp -nocase "^${botnicks},?:? (knife) (price|cost|value) (of) (.+)" $text matches botn noparse article mhhmmm details]} {
		set aknife "[string range $details [expr [string first " " $details] + 1] [string length $details]]"
    bMotionDoAction $channel $aknife "I don't know how to look up the value of $aknife .... yet"
    return 1
  }
}

bMotion_abstract_register "types_of_knives" {
  "Bravo 3"
  "BK7"
  "BM51"
  "Cryo"
  "Gladius"
  "ESEE 5"
  "Large Sebenza"
  "Leek"
  "LionSteel SR2"
  "Manix 2"
  "Mini Griptilian"
  "Paramilitary 2"
  "Pink Hello Kitty Fruit Parer Slicer"
  "Rike 1507"
  "Southard"
  "940-1"
  "XM-18"
  "ZT 0450"
}

