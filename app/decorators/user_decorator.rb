class UserDecorator < Draper::Decorator
  # 「このDecoratorで包んだけど、元のUserオブジェクトが持っているメソッドも呼べるようにしてね」という指示
  # UserオブジェクトをDecoratorで包んで、UserDecoratorの機能を使えるようにする
  delegate_all

  # viewで、姓名の情報を用いてフルネームで表示できるようにする
  def full_name
    "#{object.last_name} #{object.first_name}"
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
