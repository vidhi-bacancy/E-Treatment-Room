class PrescriptionsController < ApplicationController
	def new
		if session[:checkdoc_id] !=nil
			@prescription = Prescription.new
		else
			redirect_to doctorlogin_path
		end
	end
	def create
		@doctor = Doctor.find(params[:doctor_id])
		@prescription = @doctor.prescriptions.create(prescription_params)
		if @prescription.save
			flash[:success]="successfully added prescription"
			redirect_to new_doctor_prescription_path(@doctor)
		else
			flash[:warning]="Error has Occured!! try again"
			render 'new'
		end
	end
	def docviewall
		if session[:checkdoc_id] !=nil
			if params[:search]
				@prescription =Prescription.search(params[:search][:searchtext])
			else
				@prescription = Prescription.all
			end
		else
			redirect_to doctorlogin_path
		end
	end
	def adminviewall
		if session[:checkadmin_id] !=nil
			if params[:search]
				@prescription =Prescription.search(params[:search][:searchtext])
			else
				@prescription = Prescription.all
			end
		else
			redirect_to adminlogin_path
		end
	end
	def patviewall
		if session[:checkuser_id] !=nil
			if params[:search]
				@prescription =Prescription.search(params[:search][:searchtext])
			else
				@prescription = Prescription.all
			end
		else
			redirect_to login_path
		end
	end
	def index
		if session[:checkdoc_id] !=nil
			@prescription = Prescription.select(:id,:disease,:medicines,:dose).where(doctor_id: session[:checkdoc_id])
		else
			redirect_to doctorlogin_path
		end
	end
	def edit
		if session[:checkdoc_id] !=nil
			@doctor = Doctor.find(params[:doctor_id])
	    	@prescription = @doctor.prescriptions.find(params[:id])
		else
			redirect_to doctorlogin_path
		end
	end
	def update
		@doctor = Doctor.find(params[:doctor_id])
	    @prescription = @doctor.prescriptions.find(params[:id])
	    if @prescription.update(prescription_params)
	    	flash[:success]="successfully edited prescription"
	    	redirect_to doctor_prescriptions_path
	    else
	    	flash[:warning]="Error has Occured!! try again"
	    	render 'edit'
	    end
	end
	def destroy
		@doctor = Doctor.find(params[:doctor_id])
	    @prescription = @doctor.prescriptions.find(params[:id])
	    @prescription.destroy
	    flash[:success]="Deleted successfully!!!"
	    redirect_to doctor_prescriptions_path(@prescription)
	end

	private
	def prescription_params
		params.require(:prescription).permit(:disease, :medicines, :dose )
	end
end