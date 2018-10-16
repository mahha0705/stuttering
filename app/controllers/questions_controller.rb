class QuestionsController < ApplicationController

  def index
    # binding.pry
    if params[:sort].present?
      question_ids = QuestionTag.select("question_id").where(tag: params[:sort])
      @questions = Question.where(id: question_ids).newest.page(params[:page])
    else
      @questions = Question.newest.page(params[:page])
    end

    @search_result = nil
    @newest_school_questions_limit5  = Question.school.newest.limit(3)
    @newest_work_questions_limit5= Question.work.newest.limit(3)
    @newest_jobHunting_questions_limit5  = Question.job_hunting.newest.limit(3)
    @newest_relationship_questions_limit5  = Question.relationship.newest.limit(3)
    @newest_other_questions_limit5  = Question.other.newest.limit(3)
  end

  def search
    if params[:seacrh_sort].present?
      question_ids = QuestionTag.select("question_id").where(tag: params[:seacrh_sort])
      @questions = Question.where(id: question_ids).page(params[:page])
    else
      @questions = Question.page(params[:page])
    end

    if params[:time_sort].present?
      @questions = @questions.order(created_at: params[:time_sort])
    else
      @questions
    end

    if (params[:has_answers] && params[:no_answers]) || (params[:has_answers].nil?  && params[:no_answers].nil? ) then
      @questions
    elsif params[:has_answers] && (params[:no_answers].nil?) then
      @questions = @questions.where.not(answers_count: 0)
    else
      @questions = @questions.where(answers_count: 0)
    end

    if params[:keyword].present?
      @questions = @questions.where('title LIKE(?) OR body LIKE(?)', "%#{params[:keyword]}%","%#{params[:keyword]}%")
    else
      @questions
    end
    @search_result = "検索結果 #{@questions.count}件"
    render 'index'
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
