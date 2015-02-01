#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Collection of functions that are useful for naively parsing LaTeX code
"""

import re
import files




def remove_comments(tex):
    """
    Strip all comments from the TeX code
    """
    return re.sub(r'%(.+)\n', r'', tex)


def list_included_articles(master_file):
    """
    List all articles included in the master file
    """
    tex = files.read_file(master_file)
    tex = remove_comments(tex)

    articles = re.findall('\\input{(.*)}', tex) + \
               re.findall('\\include{(.*)}', tex)

    # Clean up
    return [
        files.remove_extension(files.prepend_dot_thingy(article))
        for article
        in articles
    ]
