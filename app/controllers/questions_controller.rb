class QuestionsController < ApplicationController

  def index
    if params[:sort].present?
      question_ids = QuestionTag.select("question_id").where(tag: params[:sort])
      @questions = Question.where(id: question_ids).newest.page(params[:page])
    else
      @questions = Question.newest.page(params[:page])
    end

    # @newest_school_questions_limit5  = Question.school.newest.limit(3)
    # @newest_work_questions_limit5= Question.work.newest.limit(5)
    # @newest_jobHunting_questions_limit5  = Question.job_hunting.newest.limit(5)
    # @newest_relationship_questions_limit5  = Question.relationship.newest.limit(5)
    # @newest_other_questions_limit5  = Question.other.newest.limit(5)

  end

  def new
    @question = Question.new
    @question.questionTags.build
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to root_path , notice: '投稿完了しました'
    else
      # @question = Question.new
      @question.questionTags.build
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers
    @comment = Comment.new
  end


  private
    def question_params
      params.require(:question).permit(:title, :body, questionTags_attributes: [:tag]).merge(user_id: current_user.id)
    end

end
