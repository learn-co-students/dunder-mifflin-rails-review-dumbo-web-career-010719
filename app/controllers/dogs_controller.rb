class DogsController < ApplicationController
  def index
    #code
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
