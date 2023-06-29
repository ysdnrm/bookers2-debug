class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # 検索モデル→params[:range]
    @range = params[:range]
# 検索モデルUserorBookで条件分岐
    if @range == "User"
      # 検索方法→params[:search],検索ワード→params[:word]
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
    @word = params[:word]
  end

end
