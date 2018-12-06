class ApplicationController < ActionController::Base
before_action :set_current_user
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/sessions/new")
    end
  end

  def other_person
    if  @blog.user_id != current_user.id
      flash[:notice] = "他の人の投稿です"
      redirect_to("/blogs")
    end
  end

  protect_from_forgery with: :exception
  include SessionsHelper
  end
end
