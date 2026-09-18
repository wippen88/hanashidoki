class AddProfileFieldsToUsers < ActiveRecord::Migration[7.2]
  def change
    # ユーザー登録時に入力してもらう姓
    add_column :users, :last_name, :string, null: false

    # ユーザー登録時に入力してもらう名
    add_column :users, :first_name, :string, null: false

    # 話しかけていいステータスのフラグ（０，１，２，３で制御）→user.rbにenumを設定
    # デフォルト値は0（ステータス：話せます）
    add_column :users, :busy_status, :integer, default: 0, null: false

    # 入力してもらう一言メッセージ欄（空欄可）
    add_column :users, :status_message, :string, limit: 30
  end
end