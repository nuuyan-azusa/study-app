class DiariesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :move_diary, only: [:edit, :destroy]
  def index
    @diaries = Diary.includes(:user).order('created_at DESC')
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.valid?
      @diary.save
      redirect_to diaries_path 
    else
      render :new
    end
  end

  def show
  end

  def search
    split_keyword = params[:keyword].split(/[[:blank:]]+/)
    @diaries = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @diaries += Diary.where('title LIKE(?)', "%#{keyword}%") && Diary.where('text LIKE(?)', "%#{keyword}%")
    end
    @diaries.uniq!
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

  def destroy
    if @diary.destroy
      redirect_to diaries_path 
    else
      render :show
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:title,:text,:year_id,:month_id,:day_id,:hour_id,:minute_id,:url_text,:rate).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def move_diary
    unless current_user.id == @diary.user.id
      redirect_to root_path
    end
  end

end
