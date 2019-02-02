# frozen_string_literal: true

RSpec.describe Fushin::HybridAnalysis, :vcr do
  subject { Fushin::HybridAnalysis.new }

  describe ".quick_url_scan" do
    it "should return a hash" do
      res = subject.quick_url_scan("http://file.tancyo.blog.shinobi.jp/524fe724")
      expect(res).to be_a(Hash)
    end
  end
end
