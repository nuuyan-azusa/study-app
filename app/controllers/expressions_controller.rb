class ExpressionsController < ApplicationController

  def index
    @expressions = Expression.includes(:user).order('created_at DESC')
  end
  
  def new
    @expression = Expression.new
  end

  def create
    @expression = Expression.new(expression_params)
    if @expression.valid?
      @expression.save
      redirect_to expressions_path
    else
      render :new
    end
  end

  def show
    @expression = Expression.find(params[:id])
  end

  private
  def expression_params
    params.permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

end
