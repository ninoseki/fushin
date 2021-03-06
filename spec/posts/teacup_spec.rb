# frozen_string_literal: true

RSpec.describe Fushin::Posts::Teacup, :vcr do
  subject { Fushin::Posts::Teacup.new("https://sea.ap.teacup.com/bsai/816.html") }

  describe "#btcs" do
    it "should return an Array" do
      btcs = subject.btcs
      expect(btcs).to be_an(Array)
      expect(btcs.length).to eq(1)
    end
  end

  describe "#urls" do
    it "should return an Array" do
      urls = subject.urls
      expect(urls).to be_an(Array)
      expect(urls.length).to eq(0)
    end
  end

  describe "#links" do
    it "should return an Array" do
      links = subject.links
      expect(links).to be_an(Array)
      expect(links.length).to eq(0)
    end
  end

  context "when dealing with a post which has problematic encoding" do
    subject { Fushin::Posts::Teacup.new("https://sea.ap.teacup.com/bsai/842.html") }

    describe "#links" do
      it "should return an Array" do
        links = subject.links
        expect(links).to be_an(Array)
        expect(links.length).to eq(1)
      end
    end
  end

  context "when dealing with complex urls" do
    subject { Fushin::Posts::Teacup.new("https://sea.ap.teacup.com/kbdt/1128.html") }

    describe "#urls" do
      it "should return an Array" do
        urls = subject.urls
        expect(urls).to be_an(Array)
        expect(urls.length).to eq(1)
      end
    end
  end
end
