class UsersController < ApplicationController

	def index

		@current_user = User.all


	end 



end
