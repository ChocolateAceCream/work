class Territory < ActiveRecord::Base
  has_many	:salesreps, 
  		    class_name: "salesrep", 
  		    foreign_key: "territorynumber", primary_key: "number",dependent: :destroy
  						


  
  default_scope -> { order(created_at: :desc)}
  #mount_uploader :picture, PictureUploader
  validates :number, presence: true
  validates :name, presence: true, length: { maximum: 140}
  #validate :picture_size

end
