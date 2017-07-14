class TreesController < ApplicationController
  before_action :set_tree, except: [:index, :new, :create]

  def index
    limit = params[:limit] || 10
    offset = params[:offset] || 0
    @tree = Tree.new
    @trees = Tree.limit(limit).offset(offset)
  end

  def create
    @tree = Tree.new(tree_params)
    if @tree.update(tree_params)
      redirect_to trees_url, notice: 'Tree saved'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tree.update(tree_params)
      redirect_to trees_url, notice: 'Tree saved'
    else
      render :edit
    end
  end

  def tree_params
    params.require(:tree).permit(:name)
  end

  def set_tree
    @tree = Tree.find(params[:id])
  end

end
