#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Collection of functions that can be used for path-related things
"""

from os import stat, mkdir, listdir
from os.path import isdir, isfile, join




def create_path(path):
    """
    Recursive mkdir
    """
    path = path.replace('./', '').split('/')

    partial_path = '.'

    for path_part in path:
        partial_path += '/' + path_part
        
        try:
            stat(partial_path)
        except:
            mkdir(partial_path)


def remove_extension(string):
    """
    Remove the extension from the string if it has one
    """
    # [1:], because the first dot doesn't count
    if '.' in string[1:]:
        return '.'.join(string.split('.')[:-1])
    else:
        return string


def prepend_dot_thingy(string):
    """
    Prepend './' to the string if it doesn't already start with it
    """
    if len(string) < 2 or string[:2] != './':
        return './' + string
    else:
        return string


def read_file(file_name):
    """
    Read file contents
    """
    f = open(file_name)
    contents = f.read()
    f.close()

    return contents


def list_files_in_folder(path):
    """
    List all files in the folder
    """
    return [
        join(path, file_name)
        for file_name
        in listdir(path)
        if isfile(join(path, file_name))
    ]


def list_folders_in_folder(path):
    """
    List all folders in the folder
    """
    return [
        join(path, file_name)
        for file_name
        in listdir(path)
        if isdir(join(path, file_name))
    ]
