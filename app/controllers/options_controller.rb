class OptionsController < ApplicationController

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(option_params)
    if @option.valid?
      @option.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def option_params
    params.require(:option).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

end
