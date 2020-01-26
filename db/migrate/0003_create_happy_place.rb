class CreateHappyPlace < ActiveRecord::Migration[4.2]
  def change
    create_table :happy_places do |t|
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
      t.string :message
      t.string :media_url
    end
  end
end