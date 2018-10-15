class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @questions = Question.where(user_id: @user.id)
    @my_answer_questions = Question.joins(:answers).where(user_id: @user.id)
  end
  def edit

  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:stuttering,:about,:avatar)
  end
end
