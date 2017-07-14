require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  should belong_to(:parent)
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).scoped_to([:parent_id, :tree_id])
  should belong_to(:tree)

  test 'top level nodes' do
    nodes = create_list(:node, 2)
    assert_same_elements nodes.collect(&:id), Node.top_level_nodes.collect(&:id)
  end

  test 'should have unique name ' do
    node = create(:node)
    child_nodes = create_list(:node, 2,  parent: node)
    assert_same_elements node.children.collect(&:id), child_nodes.collect(&:id)
  end
end
