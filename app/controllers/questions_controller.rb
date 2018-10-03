class QuestionsController < ApplicationController
  def index
    # @questions = Question.all
    @questions = Question.order("created_at DESC")
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to root_path , notice: '投稿完了しました'
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :genre).merge(user_id: current_user.id)
    end
end
