class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # logged_in? と current_user を、ビュー（View）からも呼び出せるメソッドとして登録する
  helper_method :logged_in?, :current_user
  # このコントローラーのアクションを実行する前に require_login を実行する
  before_action :require_login

  # railsのflashに「success」「danger」を追加する
  add_flash_types :success, :danger

  # ログインしているかどうかを確認する
  # current_userが存在するならtrue（ログインしている）、なければfalse（ログインしていない）
  def logged_in?
    !!current_user
  end

  # ログアウトしたとき
  def logout
    # 「このブラウザは誰としてログインしているか」という情報を消す
    session[:user_id] = nil
    # 現在のcurrent_userのキャッシュを消す
    @current_user = nil
  end

  # 現在ログインしているユーザー（User）を取得するためのメソッド
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  private

  # Application Controller内のアクションを実行する前に、ログインしているかチェックする
  def require_login
    redirect_to login_path, danger: t("flash_messages.require_login") unless logged_in?
  end
end
