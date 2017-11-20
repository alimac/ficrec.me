class CollectionsController < ApplicationController
	def new
	end

	def create
		render plain: params[:collection].inspect
	end
end
