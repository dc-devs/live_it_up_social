class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title # you need constraints here...like null: false
      t.text   :description
      t.text   :location
      t.string :category
      t.string :icon
      t.string :photo
      t.text   :necessities
      t.belongs_to :user
      t.timestamps

    end
  end
end
