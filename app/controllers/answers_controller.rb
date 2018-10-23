class AnswersController < ApplicationController
 after_action :create_notifications, only: [:create]

  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      NotificationMailer.send_when_get_answer(@answer.question.user, @answer).deliver_later
      redirect_to question_path(@answer.question_id) , notice: '投稿完了しました'
    else
      @question = Question.find(@answer.question_id)
      @answers = @question.answers
      @comment = Comment.new
      @question_comment = QuestionComment.new
      render 'questions/show'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :title, :body).merge(user_id: current_user.id)
    end

    def create_notifications
      return if @answer.question.user_id == current_user.id
       @notification = Notification.create(user_id: @answer.question.user_id,
        notified_by_id: current_user.id,
        question_id: @answer.question_id,
        notified_type: "回答")
    end
end
