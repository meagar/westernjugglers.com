class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
			t.string :homepage
      t.timestamp :starts_at
			t.timestamp :ends_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
