class OptionsController < ApplicationController

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
    @option = Option.find(params[:id])
  end

  private
  def option_params
    params.require(:option).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

end
