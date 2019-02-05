class EmployeesController < ApplicationController
  before_action :set_employees!, only: [:show, :edit, :update, :destroy]
  def index
    @employees= Employee.all
  end

  def show
  end

  def new
    flash[:error] = nil
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:error] = @employee.errors.full_messages
      render :new
    end
  end

  def edit
    flash[:error] = nil
  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to employee_path(@employee)
    else
      flash[:error] = @employee.errors.full_messages
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
  end

  def set_employees!
    @employee = Employee.find(params[:id])
  end
end
