@local
Feature:

Scenario: match examples
* def cat = 
  """
  {
    name: 'Billie',
    kittens: [
      { id: 23, name: 'Bob' },
      { id: 42, name: 'Wild' }
    ]
  }
  """

# using js-style access patterns - FAIL: name mismatch
* match cat.kittens[0].name == 'Bobby'

# using Json-Path - FAIL: wrong order
* match cat.kittens[*].id == [42, 23]

# contains - FAIL: missing expected value
* match cat.kittens[*].id contains 99

# contains - FAIL: wrong order is still okay, but inject a wrong element
* match cat.kittens[*].id contains [42, 99]

# any depth - FAIL: missing a name
* match cat..name == ['Billie', 'Bob']  

# accessing nested objects - FAIL: wrong object order is okay, but value changed
* match cat.kittens contains [{ id: 42, name: 'Wild' }, { id: 23, name: 'Rob' }]

# using fuzzy-matching - FAIL: `id` doesn't match
* match cat.kittens contains { id: 99, name: '#string' }

* eval java.lang.Thread.sleep(10000)
