module NameGenerator

  FIRST_NAME_POOL = [
    'Abraham', 'George', 'Benjamin', 'Franklin', 'Helen', 'Thomas',
    'Jackie', 'Neil', 'Walt', 'John', 'Rosa', 'Susan', 'Elizabeth',
    'Jonas', 'Margaret', 'Elvis', 'Michael', 'Bill', 'Steven',
    'Daniel', 'James', 'Alexander', 'Andrew', 'Douglas', 'Dwight',
    'Irving', 'Amelia', 'Louis', 'Jesse', 'Ted', 'Martin', 'Johnny',
    'Joe', 'Larry', 'Kimberley', 'David', 'Mary', 'Sarah', 'Anna',
    'Sally', 'Jane', 'Emily', 'Katharine', 'Angelina', 'Alice'
  ]

  def self.first_name
    FIRST_NAME_POOL.sample
  end
end
