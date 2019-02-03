# frozen_string_literal: true

RSpec.describe Fushin::Models::BTC do
  subject { Fushin::Models::BTC.new("145SmyE7DBEQExsnXZobojbQqr5UdgbCHh") }

  describe "#title" do
    it "should return a String" do
      expect(subject.title).to eq("BTC: 145SmyE7DBEQExsnXZobojbQqr5UdgbCHh")
    end
  end

  describe "#bitcon_abuse_link" do
    it "should return a link to bitcoinabuse.com" do
      expect(subject.bitcoin_abuse_link).to eq("https://www.bitcoinabuse.com/reports/145SmyE7DBEQExsnXZobojbQqr5UdgbCHh")
    end
  end

  describe "#to_attachements" do
    it "should return an Array" do
      expect(subject.to_attachements).to be_an(Array)
    end
  end
end
