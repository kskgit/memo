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
