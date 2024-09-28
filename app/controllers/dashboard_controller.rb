class DashboardController < ApplicationController
  before_action :require_login

  def receptionist
    @patients = Patient.all
    @patients_grouped_by_day = @patients.group_by_day(:created_at).count
  end

  def doctor
    @patients = Patient.all
    @patients_grouped_by_day = @patients.group_by_day(:created_at).count
    @doctor_name = current_user.name 
  end
end
