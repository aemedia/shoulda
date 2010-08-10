require 'shoulda'
require 'shoulda/active_record/assertions'
require 'shoulda/active_record/macros'
require 'shoulda/active_record/transactional_context'

module Test # :nodoc: all
  module Unit
    class TestCase
      include ThoughtBot::Shoulda::ActiveRecord::Assertions
      extend ThoughtBot::Shoulda::ActiveRecord::Macros
    end
  end
end
