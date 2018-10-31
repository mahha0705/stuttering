class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  after_action :create_notifications, only: [:create]

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    if @answer.save
      NotificationMailer.send_when_get_answer(@question.user, @answer).deliver
      redirect_to question_path(@question), notice: '投稿完了しました'
    else
      @answers = @question.answers
      @comment = Comment.new
      @question_comment = QuestionComment.new
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :body).merge(user_id: current_user.id, question_id: params[:question_id])
    end

    def create_notifications
      return if @answer.question.user_id == current_user.id
       @notification = Notification.create(user_id: @answer.question.user_id,
        notified_by_id: current_user.id,
        question_id: @answer.question_id,
        notified_type: "回答")
    end
end
