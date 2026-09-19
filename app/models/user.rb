class User < ApplicationRecord
  # Ruby on Railsの認証ライブラリであるSorceryをUserモデルで有効化するためのメソッド
  authenticates_with_sorcery!

  # ユーザーはステータスを１つだけ持てる
  # ユーザーが削除された際に紐づく Status レコードも一緒に削除される
  has_one :status, dependent: :destroy

  # ユーザーが作成されたときに、自動的にステータスが付与されるようにする
  after_create :create_default_status

  # Emailアドレス、姓名、ステータスは必須項目（空欄を許さない）
  validates :email, presence: true , uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true

  # パスワードは３文字以上
  # if: -> { new_record? || changes[:crypted_password] }はこの条件の時だけバリデーションを実行してね　という意味→新規レコード作成もしくはcrypted_passwordカラムが更新される時のみ適用
  # 今後パスワード変更画面を実装する可能性があるので入れておく
  # パスワードは３文字以上
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # passwordとpassword_confirmationが一致しているか確認
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # passwordとpassword_confirmationは空欄を禁止
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  private
  # ユーザーが作成されたときに、話せますステータスとを付与する
  def create_default_status
    create_status(
      busy_status: :available
    )
  end
end
