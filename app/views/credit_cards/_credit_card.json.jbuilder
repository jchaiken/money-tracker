json.extract! credit_card, :id, :name, :balance, :due_date, :created_at, :updated_at
json.url credit_card_url(credit_card, format: :json)