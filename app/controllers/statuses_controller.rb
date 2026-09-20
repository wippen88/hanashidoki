# ステータスの一覧を表示するStatuesController
class StatusesController < ApplicationController
  def index
    # 各ユーザーの話しかけていいステータスを、紐づくUserと一緒にあらかじめ読み込む
    @statuses = Status.includes(:user)

    # ログインしているユーザーが、常に一番上にくるようにする
    # 自分のステータスと自分以外のステータスで配列を分割する
    # partitionメソッドで、配列の各要素に対して条件を判定する
    # 配列1,配列2 = もとの配列.partition { |もとの配列から1つずつ取り出した要素を受け取る変数| 条件式 }
    current_user_statuses, not_current_user_statuses =
    @statuses.partition { |status| status.user == current_user }

    # 分割した配列を　 + 演算子で結合する（今回重複のデータはないので、 | ではなく + を使用）
    @statuses = current_user_statuses + not_current_user_statuses
  end
end