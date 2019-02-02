# frozen_string_literal: true

RSpec.describe Fushin::Models::Attachment, :vcr do
  subject { Fushin::Models::Attachment.new("http://file.tancyo.blog.shinobi.jp/0f68aa84") }

  describe "#ha_link" do
    it "should return a link to HA" do
      expect(subject.ha_link).to eq("https://www.hybrid-analysis.com/sample/a65233cb78ffab0ac356030f80f4397511d1c943e25905ca0d0584eb63a19523/")
    end
  end

  describe "#to_attachements" do
    it "should return an Array" do
      expect(subject.to_attachements).to be_an(Array)
    end
  end
end
