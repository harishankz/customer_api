module UserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    # before_action :authenticate_user!
  end

  def set_current_user
    if session[:user_id].present?
      @current_user = User.find_by(id: session[:user_id])
    end
  end

  # def authenticate_user!
  #   @current_user.present?
  # end
end