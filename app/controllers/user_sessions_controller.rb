class UserSessionsController < ApplicationController
  # ApplicationControllerに設定されている require_login というbefore_actionを、newアクションとcreateアクションを実行するときだけスキップする
  skip_before_action :require_login, only: %i[ new create ]

  def new; end # topアクションを定義するが、何も行わない（ログイン画面を表示するだけ）

  # ログインフォームから送信された情報を受け取ったとき
  def create
    # そのメールアドレスのUserを探して、見つかったらパスワード認証する
    # Userが見つからなかったらnilを返す
    # @user = User.find_by(email: params[:email])&.authenticate(params[:password])

    if login(params[:email], params[:password])
      # session[:user_id] = @user.id
      redirect_to statuses_path, success: t(".success")
    else
      # renderは、別のアクションを経由せず、指定したViewを表示する（アクション自体は実行しない）
      flash.now[:danger] = t(".failure")
      render :new, status: :unprocessable_entity
    end
  end

  # ログインセッションを破棄（destroy）する＝ログアウトする
  def destroy
    logout
    # see_other → 別のURLを見に行ってね。そのときはGETで取得してね
    # 次のページへのリダイレクトをGETに切り替えることで、同じPOST処理をもう一度送信するような状況を避けやすくする
    redirect_to root_path, status: :see_other, success: t(".success")
  end
end
