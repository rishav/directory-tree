require 'test_helper'

class TreesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    tree = create_list(:tree, 2)
    get trees_url
    assert_response :success
    assert_equal assigns[:trees].length, 2
  end

  test "should post create" do
    assert_difference 'Tree.count' do
      post trees_url, params: {tree: {name: 'test_tree'}}
      assert_response :redirect
    end
  end

  test "should get edit" do
    tree = create(:tree, name: 'Experiment')
    get edit_tree_url(tree)
    assert_response :success
  end

  test "should get show" do
    tree = create(:tree, name: 'Experiment')
    get tree_url(tree)
    assert_response :success
  end

  test "should patch update" do
    tree = create(:tree, name: 'Experiment')
    patch tree_url(tree), params: { tree: {name: 'UpdatedTree'} }
    assert_response :redirect
    tree.reload
    assert_equal tree.name, 'UpdatedTree'
  end

end
