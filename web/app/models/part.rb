class Part < ActiveRecord::Base
	has_and_belongs_to_many	:vendors
	default_scope -> { order(created_at: :desc)}
end
