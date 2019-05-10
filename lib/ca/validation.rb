require "ca/validation/railtie"
require "ca/validation/core_ext"
require "dry-validation"

module Ca
  module Validation
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def validate(&block)
        @schema = Dry::Validation.Params(&block)
      end

      def call(parameters)
        @schema.call(parameters)
      end
    end
  end
end
