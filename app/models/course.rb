class Course < ApplicationRecord
  validates :short_name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:2, maximum:6}
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum:5, maximum:100}
  validates :description, presence: true

  has_many :student_courses
  has_many :students, through: :student_coursesx
end
