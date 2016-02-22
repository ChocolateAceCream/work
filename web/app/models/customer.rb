class Customer < ActiveRecord::Base
	default_scope -> { order(created_at: :desc)}
	belongs_to	:salesrep, class_name: "Salesrep", foreign_key: "salesrepnumber", primary_key: "sales_rep_number"
end
