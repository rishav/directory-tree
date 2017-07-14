require 'test_helper'

class TreeTest < ActiveSupport::TestCase
  should have_many(:nodes)
  should have_many(:top_level_nodes)
end
