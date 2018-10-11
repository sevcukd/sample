class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		end
	end

	def login
		@user = User.new
	end

	def resoult
		pp params[:user][:email]
		pp params[:user][:password]
		pp @user = User.find_by(email: params[:user ][:email], password: params[:user][:password])
		redirect_to user_path(@user.id)
 	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		if @user.save
			redirect_to user_path(@user.id)
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		@user.save

		redirect_to root_path
	end

	private 
		def user_params
			params.require(:user).permit(:firstname, :lastname, :email, :password)
		end
end
