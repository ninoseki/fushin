# frozen_string_literal: true

RSpec.describe Fushin::Models::Website, :vcr do
  subject { Fushin::Models::Website.new("https://github.com") }

  describe "#domain" do
    it "should return a domain name of a given url" do
      expect(subject.domain).to eq("github.com")
    end
  end

  describe "#urlscan_link" do
    it "should return a link to urlscan.io" do
      expect(subject.urlscan_link).to eq("https://urlscan.io/domain/github.com")
    end
  end

  describe "#vt_link" do
    it "should return a link to virustotal" do
      expect(subject.vt_link).to eq("https://www.virustotal.com/#/url/09a8b930c8b79e7c313e5e741e1d59c39ae91bc1f10cdefa68b47bf77519be57")
    end
  end

  describe "#to_attachements" do
    it "should return an Array" do
      expect(subject.to_attachements).to be_an(Array)
    end
  end

  context "when given a shortened URL" do
    subject { Fushin::Models::Website.new("http://t.cn/EqZfINF?50rLrb") }

    describe "#uri" do
      it "should return expanded URL" do
        expect(subject.uri.to_s).to eq("http://www.bestsafestore.ru/")
      end
    end
  end
end
