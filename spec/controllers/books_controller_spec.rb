require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe "#index" do
    # 正常なレスポンスか？
    it "responds successfully" do
      get :index, params: {is_readed: false, uid: 'glzm8HISc6SK1qk6L20HSQZrcZN2'}
      expect(response.status).to eq(200)
    end
  end
end

RSpec.describe BooksController, type: :controller do
  describe "#create" do
    # 正常なレスポンスか？
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
