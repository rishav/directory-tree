class Node < ApplicationRecord

  validates :name, presence: true
  validates_uniqueness_of :name, scope: [:parent_id]

  belongs_to :parent, class_name: 'Node', foreign_key: 'parent_id', optional: true
  belongs_to :tree, optional: true
  has_many :children, class_name: 'Node', foreign_key: 'parent_id', dependent: :destroy

  scope :top_level_nodes, -> { where(parent_id: nil) }

end
