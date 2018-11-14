class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @questions = Question.where(user_id: @user.id).page(params[:page])
    @my_answer_questions = Question.where(id: Answer.select("question_id").where(user_id: @user.id)).page(params[:page])

  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :stuttering, :about, :avatar, :age, :gender, :display_allowed)
  end
end