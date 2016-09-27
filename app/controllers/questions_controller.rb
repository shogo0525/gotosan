class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    #@question.user_id = current_user.id
    if @question.save
      redirect_to root_path, success: "Successfully created your prototype."
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
