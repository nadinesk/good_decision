class CreateProCons < ActiveRecord::Migration[5.1]
  def change
    create_table :pro_cons do |t|
      t.references :decision, foreign_key: true
      t.string :description
      t.integer :weight

      t.timestamps
    end
  end
end
