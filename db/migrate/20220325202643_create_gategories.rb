class CreateGategories < ActiveRecord::Migration[7.0]
  def change
    create_table :gategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
