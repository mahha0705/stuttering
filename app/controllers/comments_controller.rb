class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to question_path(@comment.answer.question_id) , notice: '投稿完了しました'
    else
      @question = Question.find(@comment.answer.question_id)
      @answers = @question.answers
      @answer = Answer.new
      # binding.pry
      render 'questions/show'
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:answer_id, :body).merge(user_id: current_user.id)
    end
end
