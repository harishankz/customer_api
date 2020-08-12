class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource class: "User"
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    authorize! :read, @users
    render json: @users
  end

  # GET /users/1
  def show
     render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.role_id = params[:role]
    @user.password = params[:password]
    if @user.save
      render json: @user, status: :created, location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    customized_user_params = user_params
    customized_user_params[:role_id] = params[:role]
    customized_user_params[:password] = params[:password]
    if @user.update(customized_user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:id, :user_name, :email, :password, :phone_number, :role_id, :gender, :date_of_birth)
  end
end
