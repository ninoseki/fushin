# frozen_string_literal: true

RSpec.describe Fushin::Posts::Seesaa, :vcr do
  context "when only having links" do
    subject { Fushin::Posts::Seesaa.new("http://patent.seesaa.net/article/463738150.html") }

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
        expect(urls.length).to eq(2)
      end
    end

    describe "#links" do
      it "should return an Array" do
        links = subject.links
        expect(links).to be_an(Array)
      end
    end
  end

  context "when only having a btc" do
    subject { Fushin::Posts::Seesaa.new("http://patent.seesaa.net/article/463958096.html") }

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
      end
    end
  end
end
