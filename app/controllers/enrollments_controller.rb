class EnrollmentsController < ApplicationController
  def index
    @enrollments = current_student.courses
  end
end