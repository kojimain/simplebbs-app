require 'rails_helper'

RSpec.describe ApplicationForm do
  let(:some_form) {
    module ApplicationFormSpec 
      class SomeForm < ApplicationForm
      end
    end
    ApplicationFormSpec::SomeForm.new()
  }
  describe "mixin" do
    it "includes ActiveModel::Model" do
      expect(some_form.class.include?(ActiveModel::Model)).to be_truthy
    end
    it "includes ActiveModel::Attributes" do
      expect(some_form.class.include?(ActiveModel::Attributes)).to be_truthy
    end
    describe "includes Rails.application.routes.url_helpers" do
      it "responds to #root_path" do
        expect(some_form).to respond_to(:root_path)
      end
    end
  end
  describe "#url" do
    it "raises NotImplementedError" do
      expect{ some_form.url }.to raise_error(NotImplementedError)
    end
  end
  describe "#save" do
    context "is not valid" do
      it "returns false" do
        allow(some_form).to receive(:valid?).and_return(false)
        expect(some_form.save).to be_falsey
      end
    end
    context "is valid" do
      it "raises NotImplementedError" do
        expect{ some_form.save }.to raise_error(NotImplementedError)
      end
      it "has called #save_logic" do
        allow(some_form).to receive(:save_logic).and_return(true)
        some_form.save
        expect(some_form).to have_received(:save_logic)
      end
    end
  end
  describe "#saved?" do
    context "#save has not run" do
      it "is falsey" do
        expect(some_form.saved?).to be_falsey
      end
    end
    context "#save has already run" do
      context "is valid" do
        before do
          allow(some_form).to receive(:valid?).and_return(true)
          allow(some_form).to receive(:save_logic).and_return(true)
          some_form.save
        end
        it "is truthy" do
          expect(some_form.saved?).to be_truthy
        end
      end
      context "is not valid" do
        before do
          allow(some_form).to receive(:valid?).and_return(false)
          some_form.save
        end
        it "is falsey" do
          expect(some_form.saved?).to be_falsey
        end
      end
    end
  end
  describe "#result" do
    before do
      allow(some_form).to receive(:valid?).and_return(false)
      some_form.errors.add(:base, "some error message")
    end
    it "returns Hash instance" do
      expect(some_form.result.is_a?(Hash)).to be_truthy
    end
    describe ":status" do
      it "returns #http_status" do
        _http_status = double("http_status")
        allow(some_form).to receive(:http_status).and_return(_http_status)
        expect(some_form.result[:status]).to eq(_http_status)
      end
    end
    describe ":messages" do
      it "returns #errors.full_messages" do
        expect(some_form.result[:messages]).to eq(some_form.errors.full_messages)
      end
    end
  end
  describe "#http_status" do
    context "#saved? is truthy" do
      before do
        allow(some_form).to receive(:saved?).and_return(true)
      end
      it "returns 200" do
        expect(some_form.http_status).to eq(200)
      end
    end
    context "#saved? is falsey" do
      before do
        allow(some_form).to receive(:saved?).and_return(false)
      end
      it "returns 400" do
        expect(some_form.http_status).to eq(400)
      end
    end
  end
end
