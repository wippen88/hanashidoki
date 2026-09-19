# ステータスの一覧を表示するStatuesController
class StatusesController < ApplicationController
  def index
    # 各ユーザーの話しかけていいステータスを、紐づくUserと一緒にあらかじめ読み込む
    @statuses = Status.includes(:user)
  end
end
