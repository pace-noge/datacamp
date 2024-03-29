"""
Viewing Table details
Great job reflecting the census table! Now you can begin to learn more about the columns and structure of your table. It is important to get an understanding of your database by examining the column names. This can be done by using the .columns attribute and accessing the .keys() method. For example, census.columns.keys() would return a list of column names of the census table.

Following this, we can use the metadata container to find out more details about the reflected table such as the columns and their types. For example, information about the table objects are stored in the metadata.tables dictionary, so you can get the metadata of your census table with metadata.tables['census']. This is similar to your use of the repr() function on the census table from the previous exercise.

The code for connecting to the engine and initializing the metadata you wrote in the previous exercises is displayed for you again and for the last time. From now on and until Chapter 5, this will usually be done behind the scenes.

INSTRUCTION
-----------
Reflect the census table as you did in the previous exercise using the Table() function.
Print a list of column names of the census table by applying the .keys() method to census.columns.
Print the details of the census table using the metadata.tables dictionary along with the repr() function. To do this, first access the 'census' key of the metadata.tables dictionary, and place this inside the provided repr() function.
"""

from sqlalchemy import create_engine, MetaData, Table

engine = create_engine('sqlite:///census.sqlite')

metadata = MetaData()

# Reflect the census table from the engine: census
census = Table('census', metadata, autoload=True, autoload_with=engine)

# Print the column names
print(census.columns.keys())

# Print full metadata of census
print(repr(metadata.tables.get('census')))
