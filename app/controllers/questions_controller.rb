class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
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
