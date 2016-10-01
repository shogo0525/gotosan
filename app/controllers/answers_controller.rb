class AnswersController < ApplicationController
	before_action :authenticate_user!

  def create
    #@answer = current_user.answers.build(answer_params)
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { redirect_to blog_path(@question), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private
    # ストロングパラメーター
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end
end
