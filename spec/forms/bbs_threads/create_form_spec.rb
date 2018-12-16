require 'rails_helper'

RSpec.describe BbsThreads::CreateForm do
  let(:form_params) {
    {
      title: "some title",
    }
  }
  let(:create_form) {
    BbsThreads::CreateForm.new(form_params)
  }
  describe "inheritance" do
    it "< ApplicationForm" do
      expect(create_form.class).to be < ApplicationForm
    end
  end
  describe "#title" do
    it "returns title" do
      expect(create_form.title).to eq(form_params[:title])
    end
  end
  describe "#url" do
    it "returns api_bbs_threads_path" do
      expect(create_form.url).to eq(
        Rails.application.routes.url_helpers.
        api_bbs_threads_path
      )
    end
  end
  describe "#save" do
    it "adds 1 bbs_thread" do
      expect{
        create_form.save
      }.to change{ BbsThread.count }.by(1)
    end
  end
end
