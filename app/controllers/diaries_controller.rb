class DiariesController < ApplicationController
  before_action :set_diary, only: [:edit, :update]
  before_action :move_diary, only: [:edit]

  def index
    @diaries = Diary.includes(:user).order('created_at DESC')
  end

  def new
    @diary = Diary.new
  end

  def create
    binding.pry
    @diary = Diary.new(diary_params)
    if @diary.valid?
      @diary.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(@diary.id)
    else
      render :edit
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:title,:text,:year_id,:month_id,:day_id,:hour_id,:minute_id,:url_text).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def move_diary
    unless 
      current_user.id == @diary.user.id  
    end
  end

end
