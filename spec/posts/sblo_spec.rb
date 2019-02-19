# frozen_string_literal: true

RSpec.describe Fushin::Posts::Sblo, :vcr do
  subject { Fushin::Posts::Sblo.new("http://hamaduru.sblo.jp/article/185576413.html") }

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

  describe "#attachements" do
    it "should return an Array" do
      attachments = subject.attachements
      expect(attachments).to be_an(Array)
      expect(attachments.length).to eq(1)
    end
  end
end
