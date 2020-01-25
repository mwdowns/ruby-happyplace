class CreatePlace < ActiveRecord::Migration[4.2]
  def change
    create_table :places do |t|
      t.string :lat
      t.string :lon
    end
  end
end