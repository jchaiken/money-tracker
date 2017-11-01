User.create!(name: "Jennifer Chaiken",
            email: "jenniferchaiken@yahoo.com",
            password: "password",
            password_confirmation: "password")
            
categories = ["groceries", "fuel", "gas bill", "electric", "auto loan", "auto insurance", "mortgage", "dining out",
              "cc interest", "DBN expenses", "cc charges", "cc payments", "phone", "internet", "TV/entertainment",
              "household products", "student loans", "alcohol", "cigarettes", "MJ", "lunch accounts", "CI expenses"]
              
categories.each do |category|
  Category.create!(name: category,
                    budget_amount: 0.00)
end

bank_accounts = ["LOC Credit Union", "PayPal"]

bank_accounts.each do |account|
  Account.create!(name: account,
                  balance: 0.00,
                  account_type: "Bank")
end

cash_accounts = ["Brad's Cash", "Jenni's Cash"]

cash_accounts.each do |account|
  Account.create!(name: account,
                  balance: 0.00,
                  account_type: "Cash")
end

credit_cards = ["Capital One (Brad)", "Discover (Brad)", "Capital One (Jenni)",
                "Discover (Jenni)", "Amazon", "Chase"]
                
credit_cards.each do |card|
  Account.create!(name: card,
                  balance: 0.00,
                  account_type: "Credit",
                  due_date: Date.today,
                  minimum_payment: 0.00,
                  credit_limit: 0.00)
end

loans = ["Capital One auto", "Mortgage", "Student Loans (Brad)", "Student Loans (Jenni)"]

loans.each do |loan|
  Account.create!(name: loan,
                  balance: 0.00,
                  account_type: "Loan",
                  due_date: Date.today,
                  minimum_payment: 0.00,
                  credit_limit: 0.00)
end

bills = ["DTE", "Consumers Energy", "Metro PCS", "Spectrum"]

bills.each do |bill|
  Account.create!(name: bill,
                  account_type: "Bill",
                  due_date: Date.today,
                  minimum_payment: 0.00)
end