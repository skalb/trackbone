class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :name
      t.references :feature

      t.timestamps
    end
    add_index :bugs, :feature_id
  end
end
