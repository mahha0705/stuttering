class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    redirect_to :root
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :genre).merge(user_id: current_user.id)
    end
end
