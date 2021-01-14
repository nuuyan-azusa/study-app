class MannersController < ApplicationController

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
end
