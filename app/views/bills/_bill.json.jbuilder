json.extract! bill, :id, :name, :balance, :due_date, :created_at, :updated_at
json.url bill_url(bill, format: :json)