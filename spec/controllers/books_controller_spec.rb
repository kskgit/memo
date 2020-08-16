require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "#index" do
    it "responds successfully" do
      get :index, params: {is_readed: false, uid: 'glzm8HISc6SK1qk6L20HSQZrcZN2'}
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe "#create" do
    it "responds successfully" do
      post :create, params: {
        author: 'タイトル',
        title: '著者',
        uid: 'glzm8HISc6SK1qk6L20HSQZrcZN2'
      }
      expect(response.status).to eq(201)
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe "#create_by_multipart_form" do
    it "responds successfully" do
      post :create_by_multipart_form, params: {
        author: 'タイトル',
        title: '著者',
        uid: 'glzm8HISc6SK1qk6L20HSQZrcZN2'
      }
      expect(response.status).to eq(201)
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe "#update" do
    it "responds successfully" do
      get :update, params: {id: 23, page_number: 10}
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe "#destroy" do
    it "responds successfully" do
      get :destroy, params: {id: 23}
      expect(response.status).to eq(204)
    end
  end
end