class StudentCoursesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    if current_student.courses.include?(course)
      flash[:notice] = "You are already enrolled for this course"
      redirect_to courses_path
    else
      save = StudentCourse.create(student_id: current_student.id, course_id: course.id)
      if save
        flash[:notice] = "Successfully enrolled for the course - #{course.name}"
      else
        flash[:alert] = "Something went wrong"
      end 
      redirect_to courses_path
    end
  end  

  def destroy
    enrollment = StudentCourse.where('course_id = ? AND student_id=?', params[:course_id], current_student.id).first
    if !enrollment.nil?
      StudentCourse.destroy(enrollment.id)
      flash[:notice] = "Enrollment removed successfully"
      redirect_to enrollments_path
    else
      flash[:alert] = "Something went wrong!"
    end    
  end
end
