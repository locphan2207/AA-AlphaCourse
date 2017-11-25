class Student
  attr_reader :first_name, :last_name
  attr_accessor :courses
  
  def initialize(firstName, lastName)
    @first_name = firstName 
    @last_name = lastName 
    @courses = []
  end
  
  def name
    @first_name + " " + @last_name
  end
  
  def enroll(new_course)
    return if @courses.include?(new_course)  # nothing if already enrolled this courses
    # Extras:
    @courses.each do |course| 
      if course.conflicts_with?(new_course)
        raise "New course conflicts time with enrolled courses"
      end
    end
    
    @courses << new_course  #add course
    new_course.students << self #add student to enrolled list
  end
  
  def course_load
    hash = {}
    @courses.each do |course| 
      if hash.has_key?(course.department)
        hash[course.department] += course.credits #if department already added, then add credit
      else
        hash[course.department] = course.credits  #if not, create new entry
      end
    end
    hash
  end
end
