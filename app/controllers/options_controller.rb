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
    split_keyword = params[:keyword].split(/[[:blank:]]+/)
    @options = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @options += Option.where('name LIKE(?)', "%#{keyword}%").or(Option.where('text LIKE(?)', "%#{keyword}%"))
    end
    @options.uniq!
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
    redirect_to root_path unless current_user.id == @option.user.id
  end
end
