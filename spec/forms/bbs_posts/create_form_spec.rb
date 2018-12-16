require 'rails_helper'

RSpec.describe BbsPosts::CreateForm do
  let(:form_params) {
    {
      body: "some body\nexample\naaa",
      poster_name: "some poster_name",
    }
  }
  let(:bbs_thread) {
    FactoryBot.create(:bbs_thread)
  }
  let(:create_form) {
    BbsPosts::CreateForm.new(bbs_thread, form_params)
  }
  describe "inheritance" do
    it "< ApplicationForm" do
      expect(create_form.class).to be < ApplicationForm
    end
  end
  describe "#body" do
    it "returns body" do
      expect(create_form.body).to eq(form_params[:body])
    end
  end
  describe "#poster_name" do
    it "returns poster_name" do
      expect(create_form.poster_name).to eq(form_params[:poster_name])
    end
  end
  describe "#url" do
    it "returns api_bbs_thread_bbs_posts_path(bbs_thread)" do
      expect(create_form.url).to eq(
        Rails.application.routes.url_helpers.
        api_bbs_thread_bbs_posts_path(bbs_thread)
      )
    end
  end
  describe "#save" do
    it "adds 1 bbs_post belongs to bbs_thread" do
      expect{
        create_form.save
      }.to change{ bbs_thread.bbs_posts.count }.by(1)
    end
  end
end
