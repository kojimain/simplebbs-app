require 'rails_helper'

RSpec.describe BbsThreads::ShowView do
  before do
    @bbs_thread = FactoryBot.create(:bbs_thread)
  end
  let(:show_view){
    BbsThreads::ShowView.new(bbs_thread: @bbs_thread)
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(show_view.class).to be < ApplicationView
    end
  end
  describe "#post_initialize" do
    it "responds to bbs_thread" do
      expect(show_view.bbs_thread).to eq(@bbs_thread)
    end
  end
  describe "#bbs_thread_title" do
    it "returns bbs_thread.title" do
      expect(show_view.bbs_thread_title).to eq(@bbs_thread.title)
    end
  end
  describe "#bbs_posts_create_view" do
    it "returns BbsThreads::BbsPosts::CreateView instance" do
      expect(show_view.bbs_posts_create_view.is_a?(BbsThreads::BbsPosts::CreateView)).to be_truthy
    end
  end
  describe "#bbs_post_views" do
    it "returns Array of BbsThreads::BbsPostView instances" do
      FactoryBot.create(:bbs_post, bbs_thread: @bbs_thread)
      expect(
        show_view.bbs_post_views.
        all?{|bbs_post_view| bbs_post_view.is_a?(BbsThreads::BbsPostView) }
      ).to be_truthy
    end
  end
end
