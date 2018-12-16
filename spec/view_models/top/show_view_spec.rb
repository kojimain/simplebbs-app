require 'rails_helper'

RSpec.describe Top::ShowView do
  let(:show_view){
    Top::ShowView.new()
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(show_view.class).to be < ApplicationView
    end
  end
  describe "#bbs_threads_create_view" do
    it "returns Top::BbsThreads::CreateView instance" do
      expect(show_view.bbs_threads_create_view.is_a?(Top::BbsThreads::CreateView)).to be_truthy
    end
  end
  describe "#bbs_threads_view" do
    it "returns Array of Top::BbsThreadView instances" do
      FactoryBot.create(:bbs_thread)
      expect(
        show_view.bbs_thread_views.
        all?{|bbs_thread_view| bbs_thread_view.is_a?(Top::BbsThreadView) }
      ).to be_truthy
    end
  end
  describe "private methods" do
    describe "#bbs_threads" do
      it "returns BbsThread Relations" do
        _bbs_thread = FactoryBot.create(:bbs_thread)
        expect(show_view.send(:bbs_threads).is_a?(ActiveRecord::Relation)).to be_truthy
        expect(show_view.send(:bbs_threads).include?(_bbs_thread)).to be_truthy
      end
    end
  end
end
