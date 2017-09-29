class ChangeTimeTypeInStudySessions < ActiveRecord::Migration
  def change
    change_column :study_sessions, :time, :string
  end
end
