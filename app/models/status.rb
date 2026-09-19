class Status < ApplicationRecord
  # 話しかけていいステータスは、ユーザーに常に紐づく
  belongs_to :user

  # 一言メッセージを30文字に制限する
  validates :status_message, length: { maximum: 30 }

  # Rails 7.0以降の書き方らしい！
  # 話しかけていいステータスの整数に対応するシンボルを設定 → DBには整数で保存しつつ、Railsでは意味のある名前で扱いたい
  enum :busy_status, {
    available: 0,
    slightly_available: 1,
    busy: 2,
    away: 3
  }
end