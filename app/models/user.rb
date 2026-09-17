class User < ApplicationRecord
  # Ruby on Railsの認証ライブラリであるSorceryをUserモデルで有効化するためのメソッド
  authenticates_with_sorcery!

  # Emailアドレス、姓名、ステータスは必須項目（空欄を許さない）
  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :busy_status, presence: true

  # パスワードは３文字以上
  # if: -> { new_record? || changes[:crypted_password] }はこの条件の時だけバリデーションを実行してね　という意味
  # 今後パスワード変更画面を実装する可能性があるので入れておく
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # 一言メッセージを30文字に制限する
  validates :status_message, length: { maximum: 30 }

  # Rails 7.0以降の書き方らしい！
  # 話しかけていいステータスの整数に対応するシンボルを設定
  enum :busy_status, {
    available: 0,
    slightly_available: 1,
    busy: 2,
    away: 3
  }

end
