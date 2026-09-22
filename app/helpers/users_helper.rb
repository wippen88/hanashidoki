# ステータスの値と表示用ラベルの対応を定数で管理する
module UsersHelper
  # .freeze = あとから変更できないようにする →　定数の内容が変更されないようにする
  STATUS_LABELS = {
    "available" => "🟢 今は話せます",
    "slightly_available" => "🟡 少しなら話せます",
    "busy" => "🔴 今は難しいです",
    "away" => "⚫ 離席中"
  }.freeze

  # ステータスの値に対応する表示用ラベルを返す
  # 引数にstatusを指定することで、ラベルと連動するようにする
  def status_label(status)
    STATUS_LABELS[status]
  end
end
