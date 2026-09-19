# Statusの所属先はUsersという名前空間
# ログインしているユーザーのStatusController（ユーザーに紐づくため）
class Users::StatusesController < ApplicationController
  def edit
    # has_oneなので、findbyつけなくてcurrent_user.statusだけで取れる
    @status = current_user.status
  end

  def update; end
end