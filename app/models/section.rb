class Section < ActiveRecord::Base
  # belong_to :admin_user
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
end
# 