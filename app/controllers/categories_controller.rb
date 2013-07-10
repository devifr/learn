class CategoriesController < ApplicationController
	before_filter :authenticate_student!
	before_filter :find_id, except: [:index,:new,:create]

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end
		
	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to @category
		else
			render action: "new"
		end
	end
	
	def update
		if @category.update_attributes(params[:category])
			redirect_to @category
		else
			render action: "edit"
		end
	end
	
	def destroy
		@category.destroy
		redirect_to categories_path
	end
	private
		def find_id
			@category = Category.find(params[:id])
		end
end
