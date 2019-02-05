class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.references :paper, foreign_key: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
