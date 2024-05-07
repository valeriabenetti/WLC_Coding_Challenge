def calculate_change_quantities(cost, payment)
  # Check if cost or payment is null
  # TODO: Refactor for undefined values i.e. calculate_change_quantities(foo, bar)
  if cost.nil? || payment.nil?
    raise ArgumentError, "Both cost and payment must be provided"
  end

  # Check if cost or payment is a string
  if !cost.is_a?(Numeric) || !payment.is_a?(Numeric)
    raise ArgumentError, "Cost and payment must be numeric values"
  end

  # Convert cost and payment to float to handle potential decimal inputs
  cost = cost.to_f
  payment = payment.to_f

  # Calculate the change
  change = payment - cost

  # Define the denominations
  denominations = [100, 50, 20, 10, 5, 1, 0.25, 0.10, 0.05, 0.01]

  # Initialize the change quantities
  change_quantities = []

  # Calculate the quantity of each denomination
  denominations.each do |denomination|
    quantity = (change / denomination).to_i
    change_quantities.push(quantity)
    change -= quantity * denomination

    # Check for negative quantity
    return [] if quantity < 0
  end

  # Return the change quantities
  change_quantities
end