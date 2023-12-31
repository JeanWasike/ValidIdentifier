# -*- coding: utf-8 -*-
"""ValidIdentifier.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1Pd0i_RaBZHPExkQhxVbxeI08PP-6ntmF

Tokenize to identify use of reserved words
"""

import re
reserved_words = ['False','await','else','import','pass','None','break','except','in','raise','True','class','finally','is',
                  'return','and','continue','for','lambda','try','as','def','from','nonlocal','while','assert','del','global',
                  'not','with','async','elif','if','or','yield']

def tokenize(s):
    words = re.split("_|[0-9]",s)
    return ([i for i in words])

"""Check whether it meets initial rules and whether it has a reserved word"""

def validateIdentifier(var):
  str(var)
  valid = False
  if(bool(re.search('^[a-zA-Z_]+[0-9_]*$',var))==True):
    tokens = tokenize(var)
    for token in tokens:
      if(token != "" and token in reserved_words):
        valid = False
      else:
         valid = True

  if(valid):
    print("valid")
  else:
    print("invalid")

text = input("Enter an identifier: ")
if(text==""):
  text = "x"

validateIdentifier(text)