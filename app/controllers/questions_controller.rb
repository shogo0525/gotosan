class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only:[:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @answer = @question.answers.build
    @answer.athumbnails.build
    #3.times { @answer.athumbnails.build }
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.new
    #@question.qthumbnails.build
    1.times { @question.qthumbnails.build }

    #@tags = get_tag_list
  end

  def create
    #binding.pry
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    #binding.pry
    if @question.save
      redirect_to root_path, success: "Successfully created your prototype."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.user_id == current_user.id
      if @question.update(question_params)
        redirect_to question_path(@question.id), success: "更新しました！"
      else
        redirect_to root_path, warning: "投稿が失敗しました！"
      end
    else
      redirect_to root_path, warning: "不正な操作が行われました！"
    end
  end

  def destroy
    if @question.user_id == current_user.id
      @question.destroy
      redirect_to root_path, success: "削除しました！"
    else
      redirect_to root_path, warning: "不正な操作が行われました！"
    end
  end

  def click_tag

  end

  private
    def question_params
      params.require(:question).permit(:title, :content, :anonym, qthumbnails_attributes: [:image, :image_cache])
    end

    def set_question
      @question = Question.find(params[:id])
    end
end
