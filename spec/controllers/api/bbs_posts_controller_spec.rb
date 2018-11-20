require 'rails_helper'

RSpec.describe Api::BbsPostsController, type: :controller do

  describe "POST #create" do
    let(:bbs_post_create_form_params) {
      {
        body: "test bbs_post body\nhoge\nfuga",
        poster_name: "test poster_name",
      }
    }
    before do
      @bbs_thread = FactoryBot.create(:bbs_thread)
    end
    
    it "returns http success" do
      post :create, params: {bbs_thread_id: @bbs_thread.id, bbs_posts_create_form: bbs_post_create_form_params}
      expect(response).to have_http_status(:success)
    end
    
    it "adds a bbs_post" do
      expect {
        post :create, params: {bbs_thread_id: @bbs_thread.id, bbs_posts_create_form: bbs_post_create_form_params}
      }.to change(@bbs_thread.bbs_posts, :count).by(1)
    end
  end

end
