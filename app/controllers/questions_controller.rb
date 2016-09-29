class QuestionsController < ApplicationController
  before_action :set_question, only:[:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    #@comment = @topic.comments.build
    #@comments = @topic.comments
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
