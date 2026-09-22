class SorceryCore < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      # パスワードをハッシュ化（暗号化）する際、セキュリティを高めるためにパスワードの前後に追加する「ランダムな文字列」のことをソルトと呼ぶ
      t.string :salt

      # ユーザー登録時に入力してもらう姓
      t.string :last_name, null: false
      # ユーザー登録時に入力してもらう名
      t.string :first_name, null: false

      # 話しかけていいステータスのフラグ（０，１，２，３で制御）→user.rbにenumを設定
      # デフォルト値は0（ステータス：話せます）
      t.integer :busy_status, default: 0, null: false

      # 入力してもらう一言メッセージ欄（空欄可）
      t.string :status_message, limit: 30
      t.timestamps null: false
    end
  end
end
