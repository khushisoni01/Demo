require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "lists all post" do
      get posts_url 
      expect(response).to have_http_status(200)
    end

    it 'renders the :basic partial' do
      get posts_url
      expect(response).to render_template(partial: '_basic')
    end
  end


  describe "GET #new" do
    it "assigns a new post to @post" do
      get new_post_url
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the new template" do 
      get new_post_url
      expect(response).to render_template(:new)
    end
  end


  # describe "GET /posts/:id" do
  #   it "displays a particular post" do
  #     post = Post.create
  #     get :show, params: { id: post.id }
  #     expect(assigns(:post)).to eq(post)
  #     expect(response).to render_template(:show)
  #   end
  # end


  # describe "GET /restaurants/:restaurant_id/items/:id" do
  #   it "get item response" do
  #     user = User.create(name: "Aman", email: "aman@gmail.com", role: "basic_account", password: "abc@123")
  #     restaurant = Restaurant.create(name: "Gurukripa", description: "Pure veg", user_id: user.id)
  #     item = Item.create(name: "Samosa", price: '15', user_id: user.id, restaurant_id: restaurant.id)
  #     get  restaurant_item_path(restaurant, item)
  #     expect(response).to have_http_status(302)
  #   end
  # end
end






