from behave import *
from alumnium import Alumni
from behave.model import Table


@given('I am on the home page')
def step_impl(context):
    context.page.goto("https://autoprojekt.simplytest.de/")

@given('"{instruction}"')
def step_impl(context, instruction):
    if context.table: instruction += table_as_bullet_points(context.table)
    al: Alumni = context.al
    al.do(instruction)

@when('"{instruction}"')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction)

@then('"{condition}"')
def step_impl(context, condition):
    al: Alumni = context.al
    al.check(condition)

@then('I see that "{condition}"')
def step_impl(context, condition):
    al: Alumni = context.al
    al.check(condition, vision=True)

def table_as_bullet_points(table: Table):
    return "\n" + "\n\t-".join(table.rows)