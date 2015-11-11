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

bMotion_plugin_add_complex "stabbing" "%botnicks,?:? (please )?(stab) (.+)( with )?(.+)?" 150 bMotion_plugin_complex_stabbing "en"

proc bMotion_plugin_complex_stabbing { nick host handle channel text } {
  global botnicks
	if {[regexp -nocase "^${botnicks},?:? (please )?(stab) (.+) with (.+) (.+)" $text noparse colon frogs pop somenick predicate item]} {
    set who [string trim [string range $somenick 0 [string first " " $somenick]]]
		set stab_text "$who with $predicate $item in the %VAR{body_parts}"
    bMotionDoAction $channel $who "/stabs $stab_text"
		bMotionGetHappy
		bMotionGetHappy
		if {[bMotion_mood_get happy] > 4} {
		bMotionDoAction $channel $who "%VAR{reactions}"
		}
    return 0
	} 
	if {[regexp -nocase "^${botnicks},?:? (please )?(stab) (.+)" $text noparse colon please stab who]} {
    #set who [string trim [string range $details 0 [string first " " $details]]]
		set predicate ""
		set item "%VAR{types_of_knives}"
		
		if {[regexp -nocase "^(a|e|i|o|u|hi)" $item ]} {
			set predicate "an"
		} else {
			set predicate "a"
		}
		set stab_text "$who with $predicate $item in the %VAR{body_parts}"
    bMotionDoAction $channel $stab_text "/stabs $stab_text"
		bMotionGetHappy
		bMotionDoAction $channel $who "Next time I'll get yer %VAR{body_parts} with my %VAR{types_of_knives}"
    return 0
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

