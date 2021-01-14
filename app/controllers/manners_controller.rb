class MannersController < ApplicationController
  def new
    @manner = Manner.new
  end
  
end
