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

end
