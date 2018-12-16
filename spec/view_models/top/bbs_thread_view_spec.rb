require 'rails_helper'

RSpec.describe Top::BbsThreadView do
  before do
    @bbs_thread = FactoryBot.create(:bbs_thread)
  end
  let(:bbs_thread_view){
    Top::BbsThreadView.new(bbs_thread: @bbs_thread)
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(bbs_thread_view.class).to be < ApplicationView
    end
  end
  describe "#post_initialize" do
    it "responds to bbs_thread" do
      expect(bbs_thread_view.bbs_thread).to eq(@bbs_thread)
    end
  end
  describe "#title" do
    it "returns bbs_thread.title" do
      expect(bbs_thread_view.title).to eq(@bbs_thread.title)
    end
  end
  describe "#title_link" do
    it "returns bbs_thread_path(bbs_thread)" do
      expect(bbs_thread_view.title_link).to eq(
        Rails.application.routes.url_helpers.
        bbs_thread_path(@bbs_thread)
      )
    end
  end
  describe "#delete_bbs_thread_button_id" do
    it "returns 'delete_bbs_thread_(id)_button'" do
      expect(bbs_thread_view.delete_bbs_thread_button_id).to eq(
        "delete_bbs_thread_#{@bbs_thread.id}_button"
      )
    end
  end
  describe "delete_bbs_thread_path" do
    it "returns api_bbs_thread_path(bbs_thread)" do
      expect(bbs_thread_view.delete_bbs_thread_path).to eq(
        Rails.application.routes.url_helpers.
        api_bbs_thread_path(@bbs_thread)
      )      
    end
  end
end
