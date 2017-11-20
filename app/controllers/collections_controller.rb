class CollectionsController < ApplicationController
	def index
    @collections = Collection.all
  end

	def show
		@collection = Collection.find(params[:id])
	end

	def new
	end

	def create
		@collection = Collection.new(collection_params)

	  @collection.save
	  redirect_to @collection
	end

	private
		def collection_params
			params.require(:collection).permit(:title, :fandom)
		end
end
