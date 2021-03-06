class ToursController < ApplicationController
	def index
		@tours = Tour.all
	end

	def new
		@tour = Tour.new
	end

	def create
		@tour = Tour.new(tour_params)

		if @tour.save
	    redirect_to @tour
	  else
	    render 'new'
	  end
	end

	def edit
		@tour = Tour.find(params[:id])
	end

	def update
		@tour = Tour.find(params[:id])

		if @tour.update(tour_params)
	    redirect_to @tour
	  else
	    render 'edit'
	  end
	end


	def destroy
	  @tour = Tour.find(params[:id])
	  @tour.destroy
	 
	  redirect_to tours_path
	end

	def show
		@tour = Tour.find(params[:id])
	end

	private

	  def tour_params
	    params.require(:tour).permit(:title, :text)
	  end

end
