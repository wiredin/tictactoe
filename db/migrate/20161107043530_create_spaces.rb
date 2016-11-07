class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :player
      t.string :session_user_id

      t.timestamps
    end
  end
end
