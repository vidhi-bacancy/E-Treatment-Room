class PatientsController < ApplicationController
	# layout "application_patient"
	def new
		@patient = Patient.new
	end
	def home
	end
	def create
		@patient = Patient.new(patient_params)
		if @patient.save
			flash[:success]="Registered Successfully"
			session[:checkuser_id]=@patient.id
			redirect_to patient_path(@patient)
		else
			flash[:warning]="Error has Occured!! try again"
			render 'new'
		end
	end
	def index
		@patient = Patient.all
	end
	def show
		if session[:checkuser_id] !=nil
			@patient = Patient.find(params[:id])
		else
			redirect_to login_path
		end
	end
	def edit
		if session[:checkuser_id] !=nil
			@patient = Patient.find(params[:id])
		else
			redirect_to login_path
		end
	end
	def update
		@patient = Patient.find(params[:id])
  		if @patient.update(patient_params)
  			flash[:success]="Updated Successfully"
    		redirect_to @patient
  		else
  			flash[:warning]="Error has Occured!! try again"
    		render 'edit'
  		end
	end
	def view
		if session[:checkuser_id] !=nil
			@appointments = Appointment.select(:id,:doctor_id,:date).where(patient_id: params[:id])
		else
			redirect_to login_path
		end
	end
	def destroy
		@patient = Patient.find(params[:id])
		@patient.destroy
		flash[:success]="deleted successfully"
		redirect_to patients_path
	end

	private
	def patient_params
		params.require(:patient).permit(:name, :email, :address , :phoneno, :gender, :dob, :age, :password, :password_confirmation, :avatar)
	end
end