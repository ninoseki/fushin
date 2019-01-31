# frozen_string_literal: true

require "fushin/version"

require "fushin/erros"

require "fushin/models/model"
require "fushin/models/btc"
require "fushin/models/website"

require "fushin/posts/post"
require "fushin/posts/jugem"
require "fushin/posts/kikey"
require "fushin/posts/seesaa"
require "fushin/posts/shinobi"
require "fushin/posts/teacup"

require "fushin/item"
require "fushin/rss"
require "fushin/cache"
require "fushin/notifier"
require "fushin/monitor"

module Fushin
  class Error < StandardError; end
end
