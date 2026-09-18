class UsersController < ApplicationController
  # ApplicationControllerに設定されている require_login というbefore_actionを、newアクションとcreateアクションを実行するときだけスキップする
  skip_before_action :require_login, only: %i[ new create ]

  # 新規作成画面を表示するときに、Userオブジェクトを作ってインスタンス変数に代入する
  # これからユーザーを登録するための空のUserオブジェクトを用意して、ビューに渡している
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_status_path, success:t('.success')
    else
      flash.now[:danger]
      render :new, status: :unprocessable_entity
    end
  end

  private
  # user_params = ユーザー登録時に受け取ったパラメータの中から、保存してよい項目だけを取り出すメソッド
  # 新規作成するユーザーの情報のうち、:first_name, :last_name, :email, :password, :password_confirmation)のみを許可する
  # privateがあるので外部から直接呼び出せない
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
