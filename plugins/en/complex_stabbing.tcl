#
#
# vim: fdm=indent fdn=1

###############################################################################
# This is a bMotion plugin
# Copyright (C) Casey Bartlett 2015
#
# This program is covered by the GPL, please refer the to LICENCE file in the
# distribution; further information can be found in the headers of the scripts
# in the modules directory.
###############################################################################

bMotion_plugin_add_complex "stabbing" "%botnicks,?:? (please )?(stab) " 100 bMotion_plugin_complex_stabbing "en"

proc bMotion_plugin_complex_stabbing { nick host handle channel text } {
  global botnicks
  if {[regexp -nocase "^${botnicks},?:? (please )?(stab) (.+)" $text noparse noparse frogs pop details]} {
    set who [string trim [string range $details 0 [string first " " $details]]]
    if {$who == ""} { set who $details }
    global stabs 
    bMotionDoAction $channel $who "/stabs $who with a %VAR{types_of_knives} in the %VAR{body_parts}"
		bMotionGetHappy
		bMotionGetHappy
		if {[bMotion_mood_get happy] > 4} { 
		bMotionDoAction $channel $who "%VAR{reactions}"
		}
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

bMotion_abstract_register "body_parts" {
  "heart"
  "lungs"
  "eyelid"
  "scalp"
  "chest"
  "back"
  "tendon"
  "skull"
  "buttocks"
  "hand"
  "arm"
  "leg"
}

bMotion_abstract_register "reactions" {
  "OH NO THE BLOOD. Its so RED and VIVID."
  "Knives are poor peronal defense weapons"
  "...Your fluids seem to be leaking"
}

