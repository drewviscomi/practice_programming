# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇

# Create a hash to track each user's wallet balance
wallets = {}

# Loop through each transaction in the blockchain
for transaction in blockchain
  from_user = transaction["from_user"]
  to_user = transaction["to_user"]
  amount = transaction["amount"]
  
  # If there's a sender (not an ICO transaction), subtract from their balance
  if from_user != nil
    # Initialize wallet to 0 if user doesn't exist yet
    if wallets[from_user] == nil
      wallets[from_user] = 0
    end
    wallets[from_user] = wallets[from_user] - amount
  end
  
  # Add the amount to the recipient's balance
  # Initialize wallet to 0 if user doesn't exist yet
  if wallets[to_user] == nil
    wallets[to_user] = 0
  end
  wallets[to_user] = wallets[to_user] + amount
end

# Print each user's final balance with proper formatting
for user in wallets.keys
  balance = wallets[user]
  puts "#{user.capitalize}'s KelloggCoin balance is #{balance}"
end
