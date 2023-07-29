require 'rails_helper'

RSpec.describe "Products", type: :request do
   describe "GET #index" do
    it "returns a successful response" do
      get products_url
      expect(response).to have_http_status(200)
    end
  end

   describe "GET #new" do
    it "assigns a new Product to @product" do
      	get new_product_url
      	expect(assigns(:product)).to be_a_new(Product)
    end

    it "renders the new template" do 
      get new_product_url
      expect(response).to render_template(:new)
    end
  end

   describe "POST #create" do
      it "works!" do
        get new_product_path
        expect(response).to have_http_status(200)
      end

      it "creates a new " do
        get products_path
        expect(response).to have_http_status(200)
      end
  end

  describe "DELETE /products/:id" do
    it "delete post response" do
      account = Account.create(name: 'Khushi', email: 'khushi@gmail.com', password: '123456', role: 'basic_account')
      product = Product.create(description: "Hello world", account_id: account.id,name: "Cello Pen", price:4000)
      delete product_path(id:product.id)
      expect(response).to have_http_status(302)
    end
  end


  describe "GET /products/:id" do
	  it "displays a particular product" do
	    account = Account.create(name: 'Khushi', email: 'khushi@gmail.com', password: '123456', role: 'basic_account')
	    product = Product.create(description: "Hello world", account_id: account.id,name: "Cards",price: 1200)
	    # Use product_path instead of product_url
	    get product_path(id: product.id)
	    expect(response).to have_http_status(200)
	  end
	end
end