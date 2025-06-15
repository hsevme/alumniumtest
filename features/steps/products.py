from behave import *
from alumnium import Alumni

@given('{instruction}')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction)

@when('{instruction}')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction)

@then('{condition}')
def step_impl(context, condition):
    al: Alumni = context.al
    al.check(condition)