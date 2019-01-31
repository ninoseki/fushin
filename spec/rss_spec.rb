# frozen_string_literal: true

RSpec.describe Fushin::RSS, :vcr do
  subject { Fushin::RSS.new }

  describe "#items" do
    it "should return an Array" do
      results = subject.items
      expect(results).to be_an(Array)
    end
  end
end
