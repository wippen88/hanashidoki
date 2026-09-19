class RemoveStatusFieldsFromUsers < ActiveRecord::Migration[7.2]
  def change
    # Userテーブルからbusy_statusとstatus_messageのカラムを削除
    remove_column :users, :busy_status, :integer
    remove_column :users, :status_message, :string

    # statusテーブルのbusy_statusカラムについて、デフォルトを0にして、nullを許可しない(busy_statusにNULLは許さない)
    change_column :statuses, :busy_status, :integer, default: 0, null: false
    change_column :statuses, :status_message, :string, limit: 30
  end
end
