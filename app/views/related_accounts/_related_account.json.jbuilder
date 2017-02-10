json.extract! related_account, :id, :name, :account_type, :balance, :due_date, :created_at, :updated_at
json.url related_account_url(related_account, format: :json)