# ValidIdentifier
A project to validate identifiers in python using python and flex.

# Logic
Valid identifiers in python are defined as follows: 
      A combination of uppercase and lowercase letters, digits or an underscore(_) e.g. newVariable, _variable, new_variable
      Can't start with digit.
      Can’t use special symbols like !,#,@,%,$ etc
      Can't use keywords.

## Python Solution
Contains a function that tokenizes an input to check for any reserved words. Also contains the main function that matches the input to a regex with the specifications for a valid identifier.

## Flex file
Containes a function to identify whether an input is a keyword. Also has rules matching the valid and invalid idenifiers.
