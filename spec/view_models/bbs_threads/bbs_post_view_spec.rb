require 'rails_helper'

RSpec.describe BbsThreads::BbsPostView do
  before do
    @bbs_post = FactoryBot.create(:bbs_post)
  end
  let(:bbs_post_view){
    BbsThreads::BbsPostView.new(bbs_post: @bbs_post)
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(bbs_post_view.class).to be < ApplicationView
    end
  end
  describe "#body" do
    it "returns bbs_post.body" do
      expect(bbs_post_view.body).to eq(@bbs_post.body)
    end
  end
  describe "#poster_name" do
    it "returns bbs_post.poster_name" do
      expect(bbs_post_view.poster_name).to eq(@bbs_post.poster_name)
    end
  end
  describe "#delete_bbs_post_button_id" do
    it "returns 'delete_bbs_post_(id)_button'" do
      expect(bbs_post_view.delete_bbs_post_button_id).to eq(
        "delete_bbs_post_#{@bbs_post.id}_button"
      )
    end
  end
  describe "delete_bbs_post_path" do
    it "returns api_bbs_post_path(bbs_post)" do
      expect(bbs_post_view.delete_bbs_post_path).to eq(
        Rails.application.routes.url_helpers.
        api_bbs_post_path(@bbs_post)
      )      
    end
  end
end
