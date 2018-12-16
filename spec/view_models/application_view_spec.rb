require 'rails_helper'

RSpec.describe ApplicationView do
  let(:some_view) {
    module ApplicationViewSpec 
      class SomeView < ApplicationView
      end
    end
    ApplicationViewSpec::SomeView.new()
  }
  describe "mixin" do
    describe "includes Rails.application.routes.url_helpers" do
      it "responds to #root_path" do
        expect(some_view).to respond_to(:root_path)
      end
    end
    it "includes ActionView::Helpers::TagHelper" do
      expect(some_view.class.include?(ActionView::Helpers::TagHelper)).to be_truthy
    end
  end
  describe "#to_partial_path" do
    it "returns self.class.name.underscore" do
      expect(some_view.to_partial_path).to eq('application_view_spec/some_view')
    end
  end
end
