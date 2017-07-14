class Tree < ApplicationRecord

  has_many :nodes, dependent: :destroy
  has_many :top_level_nodes, -> {where(parent_id: nil)}, class_name: 'Node', foreign_key: :tree_id

end
