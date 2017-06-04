class CreateMatchParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :match_participants do |t|
      t.integer :match_id
      t.string :participant
      t.string :team
      t.integer :result

      t.timestamps
    end
  end
end
