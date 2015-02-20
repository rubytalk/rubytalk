class AddIndexToMembers < ActiveRecord::Migration
  def change
    change_column_null :members, :email, false
    change_column_null :members, :name, false
    add_index :members, :email, unique: true
  end
end
