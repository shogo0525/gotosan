class AnswersController < ApplicationController
	#before_action :authenticate_user!
  before_action :set_answer, only: [:edit, :update, :destroy]

  def create
    @answer = current_user.answers.build(answer_params)
    @question = @answer.question

    #binding.pry
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_path(@question), notice: '回答を投稿しました。' }
        format.json { render :show, status: :created, location: @answer }
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

	def edit
  end

  def update
    if @answer.user_id == current_user.id
      if @answer.update(answer_params)
        redirect_to question_path(@answer.question)
      else
        render :edit
      end
    else
      redirect_to root_path, warning: "不正な操作が行われました！"
    end
  end

	def destroy
		if @answer.user_id == current_user.id
    	@answer.destroy
      respond_to do |format|
        format.js { render :index }
      end
    else
      redirect_to root_path, warning: "不正な操作が行われました！"
    end
  end

  private
    # ストロングパラメーター
    def answer_params
      params.require(:answer).permit(:question_id, :content, athumbnails_attributes: [:image])
    end

		def set_answer
	    @answer = current_user.answers.find(params[:id])
	  end
end
