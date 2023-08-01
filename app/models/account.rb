 class Account < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: true

  
  followability

  acts_as_voter

  enum role: {basic_account: 0, business_account: 1}

  validates :role, inclusion: { in: roles.keys }

  after_create_commit { broadcast_append_to "accounts" }


  validates_uniqueness_of :name
  scope :all_except, ->(account) { where.not(id: account) }



  def unfollow(account)
    followerable_relationships.where(followable_id: account.id).destroy_all
  end

  # after_initialize :set_default_role, if: :new_record?



  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable
end
