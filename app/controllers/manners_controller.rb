class MannersController < ApplicationController
  before_action :set_manner, only: [:show, :edit, :update, :destroy]
  before_action :move_manner, only: [:edit, :destroy]
  def index
    @manners = current_user.manners.includes(:user).order('created_at DESC')
  end

  def new
    @manner = Manner.new
  end

  def create
    @manner = Manner.new(manner_params)
    if @manner.valid?
      @manner.save
      redirect_to manners_path
    else
      render :new
    end
  end

  def show
  end

  def search
    split_keyword = params[:keyword].split(/[[:blank:]]+/)
    @manners = []
    split_keyword.each do |keyword|
      next if keyword == ''

      @manners += Manner.where('name LIKE(?)', "%#{keyword}%").or(Manner.where('text LIKE(?)', "%#{keyword}%"))
    end
    @manners.uniq!
  end

  def edit
  end

  def update
    if @manner.update(manner_params)
      redirect_to manner_path(@manner.id)
    else
      render :edit
    end
  end

  def destroy
    if @manner.destroy
      redirect_to manners_path
    else
      render :show
    end
  end

  private

  def manner_params
    params.require(:manner).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

  def set_manner
    @manner = Manner.find(params[:id])
  end

  def move_manner
    redirect_to root_path unless current_user.id == @manner.user.id
  end
end
