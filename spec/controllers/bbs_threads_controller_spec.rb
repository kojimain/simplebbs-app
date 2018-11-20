require 'rails_helper'

RSpec.describe BbsThreadsController, type: :controller do

  describe "GET #show" do
    before do
      @bbs_thread = FactoryBot.create(:bbs_thread)
    end
    
    it "returns http success" do
      get :show, params: { id: @bbs_thread.id }
      expect(response).to have_http_status(:success)
    end
  end

end
