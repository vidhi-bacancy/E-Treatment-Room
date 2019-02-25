class DoctorsessionsController < ApplicationController
	def new
	end
	def create
		@user = Doctor.new(params.require(:doctor).permit(:name, :email, :specialist, :experience , :clinicaddress, :cliniccno, :password))
	    if Doctor.exists?(:email => @user.email)
	        @checkdoc = Doctor.where("email=?", @user.email)
	        if @checkdoc[0].password == @user.password
	            session[:checkdoc_id] = @checkdoc[0].id
	            redirect_to (@checkdoc[0])
	        else
	            flash[:warning]="Incorrect password"
	            redirect_to doctorlogin_path
	        end
	    else 
	        flash[:warning]="Incorrect username"
	        redirect_to doctorlogin_path
	    end
	end
	def destroy
		session[:checkdoc_id] = nil  
		flash[:success]="Logged Out successfully!!!"
	    #reset_session #wipe out session and everything in it
	    redirect_to doctorlogin_path
	end
end
