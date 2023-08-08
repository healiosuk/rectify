module Rectify
  module RSpec
    class StubQuery < Query
      def initialize(results) # rubocop:disable Lint/MissingSuper
        @results = Array(results)
      end

      def query
        @results
      end
    end
  end
end
