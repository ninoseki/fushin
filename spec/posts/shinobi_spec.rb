# frozen_string_literal: true

RSpec.describe Fushin::Posts::Shinobi, :vcr do
  subject { Fushin::Posts::Shinobi.new("http://tancyo.blog.shinobi.jp/%E3%83%A2%E3%83%96%E3%83%AD%E3%82%B0/erika%20sawajiri%20--") }

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
      expect(urls.length).to eq(0)
    end
  end

  describe "#links" do
    it "should return an Array" do
      links = subject.links
      expect(links).to be_an(Array)
      expect(links.length).to eq(1)
    end
  end

  describe "#attachements" do
    it "should return an Array" do
      attachments = subject.attachements
      expect(attachments).to be_an(Array)
      expect(attachments.length).to eq(1)
    end
  end
end
