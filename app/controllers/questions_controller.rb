class QuestionsController < ApplicationController
  def index
    @newest_questions = Question.newest
    @newest_school_questions = Question.school.newest
    @newest_work_questions= Question.work.newest
    @newest_jobHunting_questions = Question.job_hunting.newest
    @newest_relationship_questions = Question.relationship.newest
    @newest_other_questions = Question.other.newest

    @newest_questions_limit5  = Question.newest.limit(5)
    @newest_school_questions_limit5  = Question.school.newest.limit(5)
    @newest_work_questions= Question.work.newest.limit(5)
    @newest_jobHunting_questions_limit5  = Question.job_hunting.newest.limit(5)
    @newest_relationship_questions_limit5  = Question.relationship.newest.limit(5)
    @newest_other_questions_limit5  = Question.other.newest.limit(5)
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
    @answer = Answer.new
    @answers = @question.answers
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, :genre).merge(user_id: current_user.id)
    end
end
