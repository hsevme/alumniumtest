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
    if context.table: instruction += table_as_bullet_points(context.table)
    al: Alumni = context.al
    al.do(instruction)

@when('"{instruction}" because I see it')
def step_impl(context, instruction):
    al: Alumni = context.al
    al.do(instruction, vision=True)

@then('"{condition}"')
def step_impl(context, condition):
    if context.table: condition += table_as_bullet_points(context.table)
    al: Alumni = context.al
    al.check(condition)

@then('I see that "{condition}"')
def step_impl(context, condition):
    al: Alumni = context.al
    al.check(condition, vision=True)

def table_as_bullet_points(table: Table):
    row_text_list = [", ".join(row.cells) for row in table.rows]
    return "\n" + "\n\t-".join(row_text_list)
