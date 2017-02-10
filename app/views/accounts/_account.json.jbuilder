json.extract! account, :id, :name, :account_type, :balance, :due_date, :transaction_id, :created_at, :updated_at
json.url account_url(account, format: :json)