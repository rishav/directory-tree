class NodesController < ApplicationController
  before_action :set_tree
  before_action :set_node, only: [:edit, :update, :destroy]

  def create
    node = @tree.nodes.build(node_params)
    if node.save
      redirect_to @tree
    else
      render :edit
    end
  end

  def update
    if @node.update(node_update_params)
      redirect_to @tree
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @node.destroy
    redirect_to @tree
  end

  def set_tree
    @tree = Tree.find(params[:tree_id])
  end

  def set_node
    @node = @tree.nodes.find(params[:id])
  end

  def node_params
    params.require(:node).permit(:name, :parent_id)
  end

  def node_update_params
    params.require(:node).permit(:name)
  end

end
