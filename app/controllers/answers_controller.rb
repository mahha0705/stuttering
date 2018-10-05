class AnswersController < ApplicationController

  # def index
  #   return_back and return
  # end

  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question_id) , notice: '投稿完了しました'
    else
      @question = Question.find(@answer.question_id)
      @answers = @question.answers
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :title, :body).merge(user_id: current_user.id)
    end
end
