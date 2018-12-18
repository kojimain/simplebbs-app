require 'rails_helper'

RSpec.describe Api::BbsThreadsController, type: :controller do

  describe "POST #create" do
    let(:bbs_thread_create_form_params) {
      {
        title: "test bbs_thread title",
      }
    }
    
    it "returns http success" do
      post :create, params: {bbs_threads_create_form: bbs_thread_create_form_params}
      expect(response).to have_http_status(:success)
    end
    
    it "adds a bbs_thread" do
      expect {
        post :create, params: {bbs_threads_create_form: bbs_thread_create_form_params}
      }.to change(BbsThread.all, :count).by(1)
    end
  end
  
  describe "DELETE #destroy" do
    before do
      @bbs_thread = FactoryBot.create(:bbs_thread)
    end
    
    it "returns http success" do
      delete :destroy, params: {id: @bbs_thread.id}
      expect(response).to have_http_status(:success)
    end
    
    it "removes a bbs_thread" do
      expect{
        delete :destroy, params: {id: @bbs_thread.id}
      }.to change(BbsThread, :count).by(-1)
    end
  end
  
  describe "GET #index" do
    before do
      11.times{|n| FactoryBot.create(:bbs_thread) }
      @bbs_threads = BbsThread.all
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "returns json of bbs_threads list paginated per 10" do
      get :index
      expect(response.body).to eq(
        @bbs_threads.
        limit(10).
        map{|bbs_thread|
          bbs_thread.slice('id', 'title', 'created_at')
        }.
        to_json
      )
    end
  end

end
