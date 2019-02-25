class DoctorsController < ApplicationController
	# layout "application_doctor"
	def new
	end
	def show
		if session[:checkdoc_id] !=nil
			@doctor = Doctor.find(params[:id])
		else
			redirect_to new_doctor_path
		end
	end
	def edit
		if session[:checkdoc_id] !=nil
			@doctor = Doctor.find(params[:id])
		else
			redirect_to new_doctor_path
		end
	end
	def update
		@doctor = Doctor.find(params[:id])
  		if @doctor.update(doctor_params)
    		flash[:success]="Updated successfully"
    		redirect_to @doctor
  		else
  			flash[:warning]="Error has Occured!! try again"
    		render 'edit'
  		end
	end
	def register
		@doctor = Doctor.new
	end
	def create
		@doctor = Doctor.new(doctor_params)
		if @doctor.save
			flash[:success]="successfully register"
			redirect_to registerdoctor_path
		else
			flash[:warning]="Error has Occured!! try again"
			render 'register'
		end
	end
	def destroy
		@doctor = Doctor.find(params[:id])
		@doctor.destroy
		flash[:success]="deleted successfully"
		redirect_to doctors_path
	end
	def index
		@doctor = Doctor.all
	end
	def viewpatients
		if session[:checkdoc_id] !=nil
			@appointments = Appointment.select(:id,:patient_id,:date).where(doctor_id: params[:id])
		else
			redirect_to new_doctor_path
		end
	end
	private
	def doctor_params
		params.require(:doctor).permit(:name, :email,:specialist, :experience , :clinicaddress, :cliniccno, :password, :password_confirmation)
	end
end
