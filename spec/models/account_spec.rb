require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @invalid_account = Account.new(name: '', email: '', password: '', role: '')
    @valid_account = Account.new(name: 'Khushi', email: 'khushi@gmail.com', password: '123456', role: 'basic_account')
  end

  describe 'validations' do
    it 'validates presence of name' do
      account = @invalid_account
      account.valid?
      expect(account.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of email' do
      account = @invalid_account
      account.valid?
      expect(account.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of password' do
      account = @invalid_account
      account.valid?
      expect(account.errors[:password]).to include("can't be blank")
    end
  end
end



    


