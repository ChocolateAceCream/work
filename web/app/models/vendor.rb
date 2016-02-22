class Vendor < ActiveRecord::Base
	has_and_belongs_to_many	:parts
	default_scope -> { order(created_at: :desc)}
end
