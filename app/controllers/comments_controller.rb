class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to question_path(@question) , notice: '投稿完了しました'
    else
      @answers = @question.answers
      @answer = Answer.new
      @question_comment = QuestionComment.new
      render 'questions/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id ,answer_id: params[:answer_id])
    end
end
