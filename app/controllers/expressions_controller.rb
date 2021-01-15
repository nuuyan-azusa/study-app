class ExpressionsController < ApplicationController
  
  def new
    @expression = Expression.new
  end

  def create
    @expression = Expression.new(expression_params)
    if @expression.valid?
      @expression.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def expression_params
    params.require(:expression).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

end
