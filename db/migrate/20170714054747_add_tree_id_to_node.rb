class AddTreeIdToNode < ActiveRecord::Migration[5.1]
  def change
    add_reference :nodes, :tree, foreign_key: true
  end
end
