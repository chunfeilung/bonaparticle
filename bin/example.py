#!/usr/bin/env python
# -*- coding: utf-8 -*-

from bonaparticle import core
from bonaparticle.tasks import task, images
from sys import argv
from os.path import isfile




# Create a new BonapartechnicalEditor instance
editor = core.BonapartechnicalEditor()

# Assign two simple image conversion tasks to our newly created editor
editor.assign_task(images.NaiveCompressionTask())
editor.assign_task(images.PrintConversionTask())


if len(argv) > 1:
    file_name = argv[1]
else:
    file_name = 'Master.tex'

if isfile(file_name):
    editor.process(file_name)
else:
    editor.error(file_name + " doesn't exist")
