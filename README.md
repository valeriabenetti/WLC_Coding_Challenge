# White Label Code Challenge

Write a function that takes in a cost and payment and outputs an array of the quantities for the denominations to be given in change. [<# of 100s>, <# of 50s>, <# of 20s>, ... <# of pennies>]


This Ruby function calculates the quantities of denominations to be given as change based on a provided cost and payment.

## Usage
### Prerequisites
- Ruby installed on your system.
### Installation
- Clone this repository to your local machine.
- Navigate to the directory containing the files.
- Run IRB

```ruby
# Include the file containing the method
require_relative 'calculate_change_quantities.rb'

## Call the function
calculate_change_quantities(256, 500)
```

You can replace `256` and `500` with any number of your choice

## Functionality

The `calculate_change_quantities` function takes in two arguments:

- `cost`: The cost of the item or service.
- `payment`: The amount paid by the customer.

It should then calculate the change by subtracting the cost form payment. Next, it should determine the quantities of each denomination (e.g., bills and coins) required to make up the change. The function ensures robust error handling for null inputs, string inputs, negative change and cases where cost equals payment.

#### Edge Cases Handled

- **Null Inputs:** The function raises an ArgumentError if either `cost` or `payment` is null or not provided.
- **String Inputs:** The function raises an ArgumentError if either `cost` or `payment` is a string. 
- **Negative Change:** If the change amount is negative (i.e., payment is less than cost), the function should return an empty array.
- **Cost Equals Payment:** If the cost should equal the payment, the function returns an array of zeros indicating no change.
