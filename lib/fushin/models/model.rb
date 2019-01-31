# frozen_string_literal: true

module Fushin
  module Models
    class Model
      def title
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def to_attachements
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end
    end
  end
end
