# ステータスの状態をヘルパーで部品として保持する→定数
module UsersHelper
  STATUS_LABELS = {
    "available" => "🟢 今は話せます",
    "slightly_available" => "🟡 少しなら話せます",
    "busy" => "🔴 今は難しいです",
    "away" => "⚫ 離席中"
  }.freeze

  def status_label(status)
    STATUS_LABELS[status]
  end
end
