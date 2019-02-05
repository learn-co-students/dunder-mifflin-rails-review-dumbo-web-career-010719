class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @employees = Employee.all
  end
  
  def new
    @dog = Dog.new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
