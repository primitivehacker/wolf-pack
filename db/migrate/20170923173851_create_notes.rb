class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.string :key
      t.belongs_to :study_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
