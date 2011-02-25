class CreateExecutives < ActiveRecord::Migration
  def self.up
    create_table :executives do |t|
      t.string  :name
			t.string  :position
      t.string  :contact
      t.string  :about, :limit => 500
			t.integer :active_year

			# for paperclip
			t.string    :photo_file_name
			t.string    :photo_content_type
			t.integer   :photo_file_size
			t.timestamp :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :executives
  end
end
