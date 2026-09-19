# ページタイトルに関するメソッドをモジュールとして定義する
module ApplicationHelper
  def page_title(title = '')
    base_title = 'ハナシドキ'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  # フラッシュメッセージをヘルパーメソッドで定義
  def flash_background_color(type)
    # 文字列で受け取った引数をシンボル化
    case type.to_sym
    when :success then "bg-green-300 text-green-900"
    when :danger then "bg-red-300 text-red-900"
    else "bg-gray-300 text-gray-900"
    end
  end
end