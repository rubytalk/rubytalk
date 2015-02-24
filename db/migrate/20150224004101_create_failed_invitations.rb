class CreateFailedInvitations < ActiveRecord::Migration
  def change
    create_table :failed_invitations do |t|
      t.boolean :solved, default: false
      t.text :reason
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :failed_invitations, :members
  end
end
