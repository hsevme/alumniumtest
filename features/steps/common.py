import os
from behave import *
from alumnium import Alumni

@given('"{instruction}"')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction)

@given('the cookie banner was dismissed')
def step_impl(context):
    al: Alumni = context.al
    al.do('dismiss cookie banner')

@given('we are logged in as test user')
def step_impl(context):
    log_in(context.al)

@when('we log in as test user')
def step_impl(context):
    log_in(context.al)

@when('"{instruction}"')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction)

@then('"{condition}"')
def step_impl(context, condition):
    al: Alumni = context.al
    al.check(condition)

## UTIL

def log_in(al: Alumni):
    user_name = os.environ.get('USER_NAME')
    password = os.environ.get('USER_PASSWORD')
    al.do('click login button')
    al.do(f'log in with the name "{user_name}" and password "{password}')