ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end

  class ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

# Prevent ActionCable from interfering with regular integration/controller tests
module ActionCable
  module Server
    class Base
      def pubsub
        # Return a fake pubsub adapter to avoid crashes in test
        @pubsub ||= Class.new {
          def subscribe(*); end
          def unsubscribe(*); end
        }.new
      end
    end
  end
end
