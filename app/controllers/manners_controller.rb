class MannersController < ApplicationController
  def new
    @manner = Manner.new
  end

  def create
    @manner = Manner.new(manner_params)
    if @manner.valid?
      @manner.save
      redirect_to root_path
    else
      render :new
    end
  end

    private
    def manner_params
      params.require(:manner).permit(:name, :text, :url_text).merge(user_id: current_user.id)
    end
end
