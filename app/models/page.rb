class Page < ActiveRecord::Base
  belongs_to :subject
  #has_and_belongs_to_many :admin_users, :join_table => "admin_users_pages"
  has_and_belongs_to_many :editors,:class_name => "AdminUser"

end
