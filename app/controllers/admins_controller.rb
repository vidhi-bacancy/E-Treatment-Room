class AdminsController < ApplicationController
	# layout "application_admin"
	def new
	end
	def create
		@user = Admin.new(params.require(:admin).permit(:username, :password))
	    if Admin.exists?(:username => @user.username)
	        @checkadmin = Admin.where("username=?", @user.username)
	        if @checkadmin[0].password == @user.password
	            session[:checkadmin_id] = @checkadmin[0].id
	            redirect_to admin_path(@checkadmin[0])
	        else
	            flash[:warning]="Incorrect password"
	            redirect_to admin_path
	        end
	    else 
	        flash[:warning]="Incorrect username"
	        redirect_to admin_path
	    end
	end
	def destroy
		session[:checkadmin_id] = nil
		flash[:success]="Logged Out successfully!!!"  
	    #reset_session #wipe out session and everything in it
	    redirect_to adminlogin_path
	end
	def show
		if session[:checkadmin_id] !=nil
			@admin = Admin.find(params[:id])
		else
			redirect_to new_admin_path
		end
	end
end