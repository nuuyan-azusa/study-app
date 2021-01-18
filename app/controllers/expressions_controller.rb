class ExpressionsController < ApplicationController
  before_action :set_expression, only: [:show, :edit, :update]
  before_action :move_expression, only: [:edit]
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

  def edit
  end

  def update
    if @expression.update(expression_params)
      redirect_to expression_path(@expression.id)
    else
      render :edit
    end
  end

  private
  def expression_params
    params.require(:expression).permit(:name, :text, :url_text).merge(user_id: current_user.id)
  end

  def set_expression
    @expression = Expression.find(params[:id])
  end

  def move_expression
    unless 
      current_user.id == @expression.user.id  
    end
  end

end
