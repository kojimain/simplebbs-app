require 'rails_helper'

RSpec.describe Top::BbsThreads::CreateView do
  let(:create_view){
    Top::BbsThreads::CreateView.new()
  }
  describe "inheritance" do
    it "< ApplicationView" do
      expect(create_view.class).to be < ApplicationView
    end
  end
  describe "#form" do
    it "returns ::BbsThreads::CreateForm instance" do
      expect(create_view.form).is_a?(::BbsThreads::CreateForm)
    end
  end
end
