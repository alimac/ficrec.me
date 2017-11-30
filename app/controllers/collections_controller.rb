class CollectionsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

	def index
    @collections = Collection.all
  end

	def show
		@collection = Collection.find(params[:id])
	end

	def new
		@collection = Collection.new
	end

	def edit
    @collection = Collection.find(params[:id])
	end

	def create
		@collection = current_user.collections.build(collection_params)

	  if @collection.save
			flash[:success] = "Collection created!"
      redirect_to @collection
	  else
			@feed_items = []
      render 'new'
	  end
	end

	def update
		@collection = Collection.find(params[:id])

		if @collection.update(collection_params)
			redirect_to @collection
		else
			render 'edit'
		end
	end

	def destroy
	  @collection.destroy
	  flash[:success] = "Collection deleted"
	  redirect_to request.referrer || root_url
	end

	private
		def collection_params
			params.require(:collection).permit(:title, :fandom_id)
		end

		def correct_user
			@collection = current_user.collections.find_by(id: params[:id])
			redirect_to root_url if @collection.nil?
		end
end
