require 'rails_helper'

RSpec.describe BbsThreads::BbsPosts::CreateView do
  before do
    @bbs_thread = FactoryBot.create(:bbs_thread)
  end
  let(:create_view){
    BbsThreads::BbsPosts::CreateView.new(bbs_thread: @bbs_thread)
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(create_view.class).to be < ApplicationView
    end
  end
  describe "#post_initialize" do
    it "responds to bbs_thread" do
      expect(create_view.bbs_thread).to eq(@bbs_thread)
    end
  end
  describe "#form" do
    it "returns ::BbsPosts::CreateForm instance" do
      expect(create_view.form).is_a?(::BbsPosts::CreateForm)
    end
  end
end
