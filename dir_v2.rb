def input_students
  puts "Please enter the names and cohorts of the students,".center(75)
  puts "To finish, just hit return twice at next".center(75)
  #create an empty array
  students = []
  puts "Name:"
  name = gets.chomp
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp
      if cohort == ""
        cohort = "november"
      end
    puts "check your answer, type yes for correct, type no to redo"
    puts "name = #{name}, cohort = #{cohort}"
    check = gets.chomp
    if check == "yes"
      students << {name: name, cohort: cohort.to_sym}
      puts "Now we have #{students.count} students"
    end
    puts "Name:"
    name = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end
# print the students and their cohort, height and hobby, centred
def print(students)
  students.each_with_index do |student, index|
    puts "#{(index + 1)}. #{student[:name]} (#{student[:cohort]} cohort)".center(75, "...")
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75)
end

students = input_students
print_header
print(students)
print_footer(students)
