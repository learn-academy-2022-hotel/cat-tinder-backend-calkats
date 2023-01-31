class CreateWildcats < ActiveRecord::Migration[7.0]
  def change
    create_table :wildcats do |t|
      t.string :name
      t.integer :age
      t.string :enjoys
      t.string :dislikes
      t.string :image

      t.timestamps
    end
  end
end
