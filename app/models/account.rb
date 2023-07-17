 class Account < ApplicationRecord

  has_many :posts

  enum role: {basic_account: 0, business_account: 1}

  validates :role, inclusion: { in: roles.keys }



  # after_initialize :set_default_role, if: :new_record?


  # def set_default_role
  # 	self.role ||= :basic_account unless self.role == "business_account" 
  # end

  # def set_default_role
  # 	self.role ||= :business_account unless self.role == "basic_account" 
  # end

  # def set_default_role
  # 	self.role ||= :business_account
  # end

#   def set_default_role
#   if self.role == "basic_account"
#   	self.role ||= :business_account
#   else
#   	self.role ||= :basic_account
#   end
# end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end