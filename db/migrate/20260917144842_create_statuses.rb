class CreateStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :busy_status
      t.string :status_message

      t.timestamps
    end
  end
end
