# frozen_string_literal: true

RSpec.describe Fushin::Item, :vcr do
  context "when dealing with a jugem post" do
    subject { Fushin::Item.new(title: "test", link: "http://www-kuzumochi.jugem.jp/?eid=578") }

    describe "#post" do
      it "should return a Posts::Jugem" do
        expect(subject.post).to be_a(Fushin::Posts::Jugem)
      end
    end
  end
end
