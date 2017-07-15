require 'test_helper'

class NodesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @tree = create(:tree)
  end

  test "should create top level node" do
    assert_difference 'Node.count' do
      post tree_nodes_url(@tree), params: { node: { parent_id: nil, name: 'New Node' }}
      assert_response :redirect
    end
    assert_equal @tree.top_level_nodes.count, 1
  end

  test "should create child nodes" do
    node = create(:node, tree: @tree)
    assert_difference 'Node.count' do
      post tree_nodes_url(@tree), params: { node: { parent_id: node.id, name: 'New Node' }}
      assert_response :redirect
    end
    assert_equal node.children.count, 1
  end

  test "should get edit" do
    node = create(:node, tree: @tree)
    get edit_tree_node_url(@tree, node)
    assert_response :success
  end

  test 'should update' do
    node = create(:node, tree: @tree)
    patch tree_node_url(@tree, node), params: { node: { name: 'Something' }}
    assert_response :redirect
    node.reload
    assert_equal node.name, 'Something'
  end

  test "should destroy nodes" do
    node = create(:node, tree: @tree)
    child_nodes = create_list(:node, 3, parent:node, tree: @tree)
    assert_difference 'Node.count', -4 do
      delete tree_node_url(@tree, node)
      assert_response :redirect
    end
  end

end
