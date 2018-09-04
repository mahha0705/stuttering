class QuestionsController < ApplicationController
  def index
   @test = 'hello'
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :genre).merge(user_id: current_user.id)
    end

end
