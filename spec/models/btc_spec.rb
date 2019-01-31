# frozen_string_literal: true

RSpec.describe Fushin::Models::BTC do
  subject { Fushin::Models::BTC.new("145SmyE7DBEQExsnXZobojbQqr5UdgbCHh") }

  describe "#title" do
    it "should return a String" do
      expect(subject.title).to eq("BTC: 145SmyE7DBEQExsnXZobojbQqr5UdgbCHh")
    end
  end

  describe "#blockchain_link" do
    it "should return a link to blockchain.com" do
      expect(subject.blockchain_link).to eq("https://www.blockchain.com/btc/address/145SmyE7DBEQExsnXZobojbQqr5UdgbCHh")
    end
  end

  describe "#to_attachements" do
    it "should return an Array" do
      expect(subject.to_attachements).to be_an(Array)
    end
  end
end
