#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bonaparticle import core
from bonaparticle.tasks import task, images
from sys import argv
from os.path import isfile




DEFAULT_MASTER_FILE = 'Master.tex'


# Create a new BonapartechnicalEditor instance
editor = core.BonapartechnicalEditor()

# Assign two simple image conversion tasks to our newly created editor
editor.assign_task(images.NaiveCompressionTask())
editor.assign_task(images.PrintConversionTask())


if len(argv) > 1:
    file_name = argv[1]
    if isfile(file_name):
        editor.process(file_name)
    else:
        editor.error("\n" + file_name + " doesn't exist")
else:
    if isfile(DEFAULT_MASTER_FILE):
        editor.process(DEFAULT_MASTER_FILE)
    else:
        editor.error(
            "\nPlease supply " + DEFAULT_MASTER_FILE + " or another file name"
        )
