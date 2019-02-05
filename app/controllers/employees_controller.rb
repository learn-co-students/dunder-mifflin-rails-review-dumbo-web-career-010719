class EmployeesController < ApplicationController

    def index
        @employees=Employee.all
        render :index
    end

    def show
        @employee=Employee.find(params[:id])
        render :show
    end

    def new
        @employee=Employee.new
        render :new
    end

    def create
        @employee=Employee.new(employee_params)
        if @employee.valid?
            @employee.save
            redirect_to employee_path(@employee)
        else
            flash[:error]=[]
            flash[:error]=employee.errors.full_messages
            @employee=Employee.new
            render :new
        end
    end

    def edit
        @employee=Employee.find(params[:id])
    end

    def update
        employee=Employee.find(params[:id])
        employee.update(employee_params)
        if employee.valid?
            redirect_to employee_path(employee)
        else
            flash[:error]=[]
            flash[:error]=employee.errors.full_messages
            @employee=Employee.find(params[:id])
            render :edit
        end
    end

    def destroy
        Employee.find(params[:id]).destroy
        redirect_to employees_path
    end

    private
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
