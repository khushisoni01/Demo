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
end



