class DogsController < ApplicationController
  before_action :set_dogs!, only: [:show, :edit, :update, :destroy]
  def index
    @dogs = Dog.all
    @dogs = @dogs.sort_by {|dog| dog.employees.count}
  end

  def show
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to dog_path(@dog)
    else
      render :edit
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

  def set_dogs!
    @dog= Dog.find(params[:id])
  end
end
