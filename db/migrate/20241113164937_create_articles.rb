class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
