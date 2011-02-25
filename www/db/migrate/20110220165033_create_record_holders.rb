class CreateRecordHolders < ActiveRecord::Migration
  def self.up
    create_table :record_holders do |t|
      t.string  :name
      t.integer :score, :default => 0
			t.timestamp :time
			t.references :record

      t.timestamps
    end
  end

  def self.down
    drop_table :record_holders
  end
end
