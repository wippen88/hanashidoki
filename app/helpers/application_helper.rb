# ページタイトルに関するメソッドをモジュールとして定義する
module ApplicationHelper
  def page_title(title = '')
    base_title = 'ハナシドキ'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end