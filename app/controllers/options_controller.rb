class OptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_option, only: [:show, :edit, :update, :destroy]
  before_action :move_option, only: [:edit, :destroy]

  def index
    @options = Option.includes(:user).order('created_at DESC')
  end
  
  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    if @option.valid?
      @option.save
      redirect_to options_path
    else
      render :new
    end
  end

  def show
  end

  def search
    @options = Option.search(params[:keyword])
  end

  def edit
  end

  def update
    if @option.update(option_params)
      redirect_to option_path(@option.id)
    else
      render :edit
    end
  end

  def destroy
    if @option.destroy
      redirect_to options_path
    else
      render :show
    end
  end

  private
  def option_params
    params.require(:option).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

  def set_option
    @option = Option.find(params[:id])
  end

  def move_option
    unless current_user.id == @option.user.id  
      redirect_to root_path
    end
  end

end
