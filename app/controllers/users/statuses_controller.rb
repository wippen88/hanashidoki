# Statusの所属先はUsersという名前空間
# ログイン中のユーザーに紐づくStatusを扱うController
class Users::StatusesController < ApplicationController
  def edit
    # ログイン中のユーザーに紐づくStatusを取得する
    # has_oneなので、findbyつけなくてcurrent_user.statusだけで取れる
    @status = current_user.status
  end

  def update
    # ログイン中のユーザーに紐づくStatusを取得する
    @status = current_user.status
    # Statusの更新に成功したら、Status一覧画面にリダイレクトする
    if @status.update(status_params)
      redirect_to statuses_path, success: t(".success", item: Status.model_name.human)
    else
      # 更新に失敗した場合はエラーメッセージを表示して編集画面を再表示する
      flash.now[:danger] = t(".failure", item: Status.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  private
  # ストロングパラメータで、話していいステータスとひとこと以外の内容は受け取らないようにする
  # 更新を許可するパラメータを制限する
  # busy_statusとstatus_messageのみ受け取る
  def status_params
    params.require(:status).permit(:busy_status, :status_message)
  end
end
