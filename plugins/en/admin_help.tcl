# bMotion admin help
#
#
# $Id$
#

###############################################################################
# This is a bMotion plugin
# Copyright (C) James Michael Seward 2000-2002
#
# This program is covered by the GPL, please refer the to LICENCE file in the
# distribution; further information can be found in the headers of the scripts
# in the modules directory.
###############################################################################

#                        name   regexp               flags   callback
bMotion_plugin_add_management "help" "^help"     t       "bMotion_plugin_management_help" "any"

#################################################################################################################################
# Declare plugin functions

proc bMotion_plugin_management_help { handle { args "" } } {
  global bMotion_plugins_management

  if {$args == ""} {
		bMotion_putadmin "You can run bMotion commands from DCC with .bmotion COMMAND,"
		bMotion_putadmin "  from a channel with .bmotion BOTNICK COMMAND, and from a"
		bMotion_putadmin "  query with the bot with .bmotion COMMAND."
	  bMotion_putadmin "Loaded bMotion Admin Commands:"
	  set line ""
	  set s [array startsearch bMotion_plugins_management]
	  while {[set key [array nextelement bMotion_plugins_management $s]] != ""} {
	  	if {$key == "dummy"} {
	  		continue
	  	}
	  	append line "$key "
	  	if {[string length $line] > 50} {
	  		bMotion_putadmin "  $line"
	  		set line ""
	  	}
	  }
	  if {$line != ""} {
	  	bMotion_putadmin "  $line"
	  }
	  array donesearch bMotion_plugins_management $s

	  bMotion_putadmin "Help is available for some plugis; run .bmotion help COMMAND"
	  bMotion_putadmin "  for more information."
	  return 0
  } else {
  	switch $args {
  		"flood" {
  			bMotion_putadmin "Manage the flood protection system:"
  			bMotion_putadmin "  .bmotion flood status"
  			bMotion_putadmin "    show all tracked flood scores"
  			bMotion_putadmin "  .bmotion flood show <nick>"
  			bMotion_putadmin "    show score for <nick> (case sensitive)"
  			bMotion_putadmin "  .bmotion flood set <nick> <value>"
  			bMotion_putadmin "     set score for <nick> to <value>"
  		}
  		default {
  			bMotion_putadmin "I seem to have misplaced my help for that command."
  		}
  	}
  	return 0
  }
}