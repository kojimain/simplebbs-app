require 'rails_helper'

RSpec.describe Api::BbsThreadsController, type: :controller do

  describe "POST #create" do
    let(:bbs_thread_form_params) {
      {
        title: "test bbs_thread title",
      }
    }
    
    it "returns http success" do
      post :create, params: {bbs_threads_create_form: bbs_thread_form_params}
      expect(response).to have_http_status(:success)
    end
  end

end
