class SessionsController < ApplicationController
	def new
	end
	def create
		@user = Patient.new(params.require(:patient).permit(:name, :email, :address , :phoneno, :gender, :dob, :age, :password, :password_confirmation))
	    if Patient.exists?(:email => @user.email)
	        @checkuser = Patient.where("email=?", @user.email)
	        if @checkuser[0].password == @user.password
	            session[:checkuser_id] = @checkuser[0].id
	            redirect_to patient_path(@checkuser[0])
	        else
	            flash[:warning]="Incorrect password"
	            render :new
	        end
	    else 
	        flash[:warning]="Incorrect username"
	        render :new
	    end
  	end

  	def destroy
    	session[:checkuser_id] = nil  
    	flash[:success]="Logged Out successfully!!!"
	    #reset_session #wipe out session and everything in it
	    redirect_to home_path
	end
end
