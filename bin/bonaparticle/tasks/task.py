#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Basic support for tasks
"""

from subprocess import call
from time import time




class Task(object):
    """
    A task consists of an ordered set of steps that accomplish a certain goal
    """


    owner = None


    def set_owner(self, owner):
        """
        Set the owner of this task
        """
        self.owner = owner


    def perform(self, master_file):
        """
        Perform the task. This method should be overridden by actual tasks
        """
        self.owner.warning(
            "The " + type(self).__name__ + " doesn't consist of any steps"
        )


    def start(self, master_file):
        """
        This method is to be overridden by child classes
        """
        self.owner.info("\nStarting the " + type(self).__name__)

        start = time()
        self.perform(master_file)
        spent = round(time() - start, 2)

        self.owner.info("Finished in " + str(spent) + " second(s)")
 