"""
Build a statement to select:
The state column from the census table.
The sum of the pop2008 column from the census table.
The census_division_name column from the state_fact table.
Append a .select_from() to stmt in order to join the census and state_fact tables by the state and name columns.
Group the statement by the name column of the state_fact table.
Execute the statement stmt_grouped to get all the records and save it as results.
Hit 'Submit Answer' to loop over the results object and print each record.

INSTRUCTION
-----------
Build a statement to select:
The state column from the census table.
The sum of the pop2008 column from the census table.
The census_division_name column from the state_fact table.
Append a .select_from() to stmt in order to join the census and state_fact tables by the state and name columns.
Group the statement by the name column of the state_fact table.
Execute the statement stmt_grouped to get all the records and save it as results.
Hit 'Submit Answer' to loop over the results object and print each record.
"""
# Build a statement to select the state, sum of 2008 population and census
# division name: stmt
stmt = select([
    census.columns.state,
    func.sum(census.columns.pop2008),
    state_fact.columns.census_division_name
])

# Append select_from to join the census and state_fact tables by the census state and state_fact name columns
stmt_joined = stmt.select_from(
    census.join(state_fact, census.columns.state == state_fact.columns.name)
)

# Append a group by for the state_fact name column
stmt_grouped = stmt_joined.group_by(state_fact.columns.name)

# Execute the statement and get the results: results
results = connection.execute(stmt_grouped).fetchall()

# Loop over the results object and print each record.
for record in results:
    print(record)
