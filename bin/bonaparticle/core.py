#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
The bonaparticle.core module offers an easy interface for queuing and executing
magazine preprocessing tasks.
"""

from colorama import Fore, Back




class BonapartechnicalEditor(object):
    """
    Can queue and execute tasks
    """


    tasks = None
    success_count = 0
    warning_count = 0
    failure_count = 0


    def __init__(self):
        """
        Initialize a new editor
        """
        self.reset()
        self.info("Initialized a new BonapartechnicalEditor instance\n")


    def reset(self):
        """
        Reset the editor to a boring useless state
        """
        self.tasks = []
        self.success_count = 0
        self.warning_count = 0
        self.failure_count = 0


    def assign_task(self, task):
        """
        Add a task to the editor's list of tasks
        """
        task.set_owner(self)
        self.info("Added a " + type(task).__name__ + " to the queue")
        self.tasks += [task]


    def process(self, master_file):
        """
        Run all tasks
        """
        self.info("\nRunning queued tasks for file " + master_file)
        [
            task.start(master_file)
            for task
            in self.tasks
        ]
        self.panda()
        self.print_summary()


    def success(self, message):
        """
        Print a message indicating that an action was completed successfully
        """
        print Fore.GREEN + message + Fore.RESET
        self.success_count += 1


    def info(self, message):
        """
        Print a general message to the console
        """
        print Fore.WHITE + message + Fore.RESET


    def warning(self, message):
        """
        Print a warning message to the console
        """
        print Fore.YELLOW + message + Fore.RESET
        self.warning_count += 1


    def error(self, message):
        """
        Print an error message to the console
        """
        print Fore.RED + message + Fore.RESET
        self.failure_count += 1


    def panda(self):
        """
        Print a panda to the terminal
        """
        print
        print 32 * ' ' + ".;;."
        print 31 * ' ' + "/;;;;\  ___      .;;.    "    + \
              Fore.GREEN + "   |\\" + Fore.RESET
        print 30 * ' ' + "|;(;;;-\"\"   `'-.,;;;;;\\  "  + \
              Fore.GREEN + "    +-+" + Fore.RESET
        print 31 * ' ' + "\;'" + 12 * ' ' + "';;;);/   "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 31 * ' ' + "/" + 16 * ' ' + "\;;'    "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 30 * ' ' + "/    .;.   .;.     \\     "    + \
              Fore.GREEN + "    |X|    ___" + Fore.RESET
        print 30 * ' ' + "|   ;;o;; ;;o;;    |      "    + \
              Fore.GREEN + "   +-+   /MMMMMA." + Fore.RESET
        print 30 * ' ' + ";   '\"-'` `'-\"'    |      "  + \
              Fore.GREEN + "   |X|  /____  " + Fore.RESET
        print 30 * ' ' + "/\      ._.       /       "    + \
              Fore.GREEN + "   |X| / `VMMMA." + Fore.RESET
        print 28 * ' ' + ";;;;;_   ,_Y_,   _.'        "    + \
              Fore.GREEN + "   |X|/    " + Fore.RESET
        print 27 * ' ' + "/;;;;;\`--.___.--;.          "    + \
              Fore.GREEN + "   +-+" + Fore.RESET
        print 26 * ' ' + "/|;;;;;;;.__.;;;.  \\\\       "    + \
              Fore.GREEN + "     |X|" + Fore.RESET
        print 25 * ' ' + ";  \;;;;;;;;;;;;;;\  ;\__  .;. "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 25 * ' ' + "|   ';;;;;;;;=;;;;'  |-__;;;;/ "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 25 * ' ' + "|     `\"\"`  .---._  /;/;;\;;/  "  + \
              Fore.GREEN + "   +-+" + Fore.RESET
        print 24 * ' ' + "/ ;         /;;;;;;;-;/;;/|;/   "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 24 * ' ' + "\_,\       |;;;;;;;;;;;;| |     "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 28 * ' ' + "'-...--';;;;;;;;;;;;\/      "    + \
              Fore.GREEN + "   |X|" + Fore.RESET
        print 37 * ' ' + "`\"\"\"`   `\"`       "
        print
        print 30 * ' ' + "Thanks for flying" 
        print Fore.GREEN + 27 * ' ' + "B O N A P A R T I C L E" + Fore.RESET
        print Fore.YELLOW + 27 * ' ' + "-----------------------" + Fore.RESET
        print


    def print_summary(self):
        """
        Print a summary of the total number of failures, warnings, and
        successfully executed actions to the terminal
        """
        if self.failure_count > 0:
            print Back.RED + Fore.WHITE
            print 'FAILURES!'
        elif self.warning_count > 0:
            print Back.YELLOW + Fore.BLACK
            print 'Warnings!'
        else:
            print Back.GREEN + Fore.BLACK
            print 'OK :-)'

        print "Failures: " + str(self.failure_count) + ". " + \
              "Warnings: " + str(self.warning_count) + ". " + \
              "Successful: " + str(self.success_count) + Fore.RESET + Back.RESET
