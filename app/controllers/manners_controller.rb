class MannersController < ApplicationController
  before_action :set_manner, only: [:show, :edit, :update]
  before_action :move_manner, only: [:edit]
  def index
    @manners = Manner.includes(:user).order('created_at DESC')
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
    @manner = Manner.find(params[:id])
  end

  private
  def manner_params
    params.require(:manner).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

  def set_manner
    @manner = Manner.find(params[:id])
  end

  def move_manner
    unless 
      current_user.id == @manner.user.id  
    end
  end

end
