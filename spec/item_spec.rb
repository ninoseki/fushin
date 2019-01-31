# frozen_string_literal: true

RSpec.describe Fushin::Item do
  context "when dealing with a jugem post" do
    describe "#post" do
      let(:combinations) {
        [
          { link: "http://plaza85.jugem.jp/?eid=2830", klass: Fushin::Posts::Jugem },
          { link: "http://www.kikey.net/snapshot/entry/re-i-need-specific-ranks-to-go-5/", klass: Fushin::Posts::Kikey },
          { link: "http://patent.seesaa.net/article/463738150.html", klass: Fushin::Posts::Seesaa },
          { link: "http://tancyo.blog.shinobi.jp/%E3%83%A2%E3%83%96%E3%83%AD%E3%82%B0/erika%20sawajiri%20--", klass: Fushin::Posts::Shinobi },
          { link: "https://sea.ap.teacup.com/bsai/816.html", klass: Fushin::Posts::Teacup }
        ]
      }
      it "should return a correct class" do
        combinations.each do |combination|
          link = combination.dig(:link)
          klass = combination.dig(:klass)

          item = Fushin::Item.new(title: "test", link: link)
          expect(item.post).to be_a(klass)
        end
      end
    end
  end
end
