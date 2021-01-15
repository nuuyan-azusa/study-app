class ExpressionsController < ApplicationController

  def new
    @expression = Expression.new
  end
  
end
