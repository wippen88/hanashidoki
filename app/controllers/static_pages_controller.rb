class StaticPagesController < ApplicationController
  # ApplicationControllerに設定されている require_login というbefore_actionをtopアクションを実行するときだけスキップする
  skip_before_action :require_login, only: %i[top]

  def top; end
end
