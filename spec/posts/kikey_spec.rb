# frozen_string_literal: true

RSpec.describe Fushin::Posts::Kikey, :vcr do
  subject { Fushin::Posts::Kikey.new("http://www.kikey.net/snapshot/entry/re-i-need-specific-ranks-to-go-5/") }

  describe "#btcs" do
    it "should return an Array" do
      btcs = subject.btcs
      expect(btcs).to be_an(Array)
      expect(btcs.length).to eq(0)
    end
  end

  describe "#urls" do
    it "should return an Array" do
      urls = subject.urls
      expect(urls).to be_an(Array)
      expect(urls.length).to eq(1)
    end
  end

  describe "#links" do
    it "should return an Array" do
      links = subject.links
      expect(links).to be_an(Array)
      expect(links.length).to eq(0)
    end
  end
end
