class DogsController < ApplicationController
    def index
        @dogs=Dog.all
        if params[:sort]
            @dogs=@dogs.sort_by {|dog| dog.employees.count}
        end
        # @dogs=@dogs.sort_by {|dog| dog.employees.count} 
        render :index
    end

    def show
        @dog=Dog.find(params[:id])
        render :show
    end

end
