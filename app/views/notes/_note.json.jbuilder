json.extract! transaction, :id, :explanation, :amount, :transaction_date, :category, :transaction_type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)