class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @question = Question.find(params[:question_id])
    @comment = Comment.create(comment_params)
    if @comment.save
      NotificationMailer.send_when_get_comment(@question.user, @comment).deliver_later(wait: 30.seconds) if @question.user != @comment.user
      NotificationMailer.send_when_get_comment(@comment.answer.user, @comment).deliver_later(wait: 30.seconds) if @comment.answer.user != @comment.user
      redirect_to question_path(@question) , notice: '投稿完了しました'
    else
      @answers = @question.answers
      @answer = Answer.new
      @question_comment = QuestionComment.new
      @question_comments = @question.questionComments
      flash.now[:alert] = '処理できませんでした。もう一度投稿してください'
      render 'questions/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id ,answer_id: params[:answer_id])
    end
end
