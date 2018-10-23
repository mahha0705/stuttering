class QuestionCommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question_comment = QuestionComment.create(question_comment_params)
    if @question_comment.save
      redirect_to question_path(@question) , notice: '投稿完了しました'
    else
      @question_comments = @question.questionComments
      @answers = @question.answers
      @answer  = Answer.new
      @comment = Comment.new
      render 'questions/show'
    end
  end
  private
    def question_comment_params
      params.require(:question_comment).permit(:body).merge(question_id: params[:question_id])
    end
end
