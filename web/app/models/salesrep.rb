class Salesrep < ActiveRecord::Base
	default_scope -> { order(created_at: :desc)}
	belongs_to :territory, class_name: "Territory", 
			   foreign_key: "territorynumber", primary_key: "number"
	has_many   :customers, class_name: "Customer",
			   foreign_key: "salesrepnumber", primary_key: "sales_rep_number",dependent: :destroy
end
