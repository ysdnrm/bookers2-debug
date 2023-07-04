class GroupUsersController < ApplicationController  
  before_action :authenticate_user!
  
  # グループに参加
  def create 
    group_user = current_user.group_users.new(group_id: params[:group_id])
    group_user.save
    # 前いたページに戻る
    redirect_to request.referer
  end
  
  # グループを退会
  def destroy 
    group_user = current_user.group_users.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to request.referer
  end

end
