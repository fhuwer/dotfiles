#!/usr/bin/env python
# encoding: utf-8
from subprocess import check_output
from re import search, IGNORECASE


def get_pass(account):
   return check_output("pass " + account, shell=True).splitlines()[0]


def transform_expression(expr):
   expr_split = expr.split('/')
   if len(expr_split) > 1:
      if expr_split[-1] == '*':
         expr = '({}|{})'.format('/'.join(expr_split[:-1]), '/'.join(expr_split))
   return expr.replace('*', '.*') + '$'


def expression_match(items, value):
   return any([search(transform_expression(item), value, IGNORECASE) for item in items])
