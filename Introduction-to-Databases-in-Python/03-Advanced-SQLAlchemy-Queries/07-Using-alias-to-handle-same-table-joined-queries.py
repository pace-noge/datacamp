"""
Using alias to handle same table joined queries
Often, you'll have tables that contain hierarchical data, such as employees and managers who are also employees. For this reason, you may wish to join a table to itself on different columns. The .alias() method, which creates a copy of a table, helps accomplish this task. Because it's the same table, you only need a where clause to specify the join condition.

Here, you'll use the .alias() method to build a query to join the employees table against itself to determine to whom everyone reports.

INSTRUCTION
-----------
Save an alias of the employees table as managers. To do so, apply the method .alias() to employees.
Build a query to select the employee's name and their manager's name. The manager's name has already been selected for you. Use label to label the name column of employees as 'employee'.
Append a where clause to stmt to match where the id column of the managers table corresponds to the mgr column of the employees table.
Order the statement by the name column of the managers table.
Execute the statement and store all the results. This code is already written. Hit 'Submit Answer' to print the names of the managers and all their employees.

"""
# Make an alias of the employees table: managers
managers = employees.alias()

# Build a query to select names of managers and their employees: stmt
stmt = select(
    [managers.columns.name.label('manager'),
     employees.columns.name.label("employee")]
)

# Match managers id with employees mgr: stmt_matched
stmt_matched = stmt.where(managers.columns.id == employees.columns.mgr)

# Order the statement by the managers name: stmt_ordered
stmt_ordered = stmt_matched.order_by(managers.columns.name)

# Execute statement: results
results = connection.execute(stmt_ordered).fetchall()

# Print records
for record in results:
    print(record)

