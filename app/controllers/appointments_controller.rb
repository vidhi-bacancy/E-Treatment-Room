class AppointmentsController < ApplicationController
	def new
		if session[:checkuser_id] !=nil
			@appointment = Appointment.new
		else
			redirect_to login_path
		end
	end
	def create
		@patient = Patient.find(params[:patient_id])
		@appointment = @patient.appointments.create(params.require(:appointment).permit(:doctor_id,:date))
		if @appointment.save
			flash[:success]="successfully took appointment"
			redirect_to new_patient_appointment_path(@patient)
		else
			flash[:warning]="Error has Occured!! try again"
			render 'new'
		end
	end
	def destroy
		@patient = Patient.find(params[:patient_id])
	    @appointment = @patient.appointments.find(params[:id])
	    @appointment.destroy
	    flash[:success]="Deleted successfully!!!"
	    redirect_to view_path(session[:checkuser_id])
	end
	def view
		if session[:checkadmin_id] !=nil
			@appointment = Appointment.all
		else
			redirect_to adminlogin_path
		end
	end
end