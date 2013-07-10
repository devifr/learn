class CoursesController < ApplicationController
	before_filter :find_id, except: [:index,:new,:create]
		
	def index
		@courses = Course.all
	end
	def edit
		@category = Category.find(params[:category_id]) if params[:category_id].present?
		@categories = Category.all
	end

	def new
		@course = Course.new
		@category = Category.find(params[:category_id]) if params[:category_id].present?
		@categories = Category.all
	end

	def create
		@course = Course.new(params[:course])
		if @course.save
			redirect_to @course
		else
			render action: "new"
		end
	end

	def update
		if @course.update_attributes(params[:course])
			redirect_to @course
		else
			render action: "edit"
		end
	end

	def destroy
		@course.delete
		redirect_to courses_path
	end

	private
		def find_id
			@course = Course.find(params[:id])
		end
end