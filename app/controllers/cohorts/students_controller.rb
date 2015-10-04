class Cohorts::StudentsController < ApplicationController
  before_action :set_cohort
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = policy_scope(@cohort.students)
  end

  def show
  end

  def destroy
    @registration = @cohort.registrations.find_by(student_id: @student.id)
    @registration.update(status: 'dropped')
    redirect_to @cohort, notice: "#{@student.name} has been dropped from #{@cohort.name}"
  end

  private

    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
      authorize @cohort, :manage_students?
    end

    def set_student
      @registration = @cohort.registrations.find_by(student_id: params[:id])
      @student = @registration.student
    end

end
