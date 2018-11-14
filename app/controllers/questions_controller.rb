class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def index
    if params[:sort].present?
      @questions = Question.select_tag_questions(params[:sort] , params[:page]).newest
    else
      @questions = Question.newest.page(params[:page])
    end
  end

  def search
    #タグを選択したか判定
    if params[:seacrh_sort].present?
      @questions = Question.select_tag_questions(params[:seacrh_sort] , params[:page])
    else
      @questions = Question.page(params[:page])
    end
    #回答の有無判定
    if params[:has_answers] && params[:no_answers].nil? #回答あり選択
      @questions = @questions.has_answers
    elsif params[:has_answers].nil? && params[:no_answers]
      @questions = @questions.no_answers #回答なし選択
    end
    #キーワード検索の有無判定
    @questions = @questions.keyword_search(params[:keyword]) if params[:keyword].present?
    #新着、古い順判定
    @questions = @questions.new_or_old(params[:time_sort]) if params[:time_sort].present?
    render 'index'
  end

  def new
    @question = Question.new
    @question.questionTags.build
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      redirect_to root_path, notice: "投稿完了しました"
    else
      @question.questionTags.clear
      @question.questionTags.build
      @genre = []
      if question_params["questionTags_attributes"].present?
        question_params["questionTags_attributes"].each do |_key, value|
          @genre << value["tag"]
        end
      end
    render "new"
    end
  end

  def show
    @question = Question.find(params[:id])
    @question_comments = @question.questionComments
    @answer = Answer.new
    @answers = @question.answers
    @comment = Comment.new
    @question_comment = QuestionComment.new
  end

  private
    def question_params
      params.require(:question).permit(:title, :body, questionTags_attributes: [:tag]).merge(user_id: current_user.id)
    end
end
