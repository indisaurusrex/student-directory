def input_students
  puts "Please enter the names and cohorts of the students,".center(75)
  puts "To finish, hit return at 'Name:'".center(75)
  #create an empty array
  students = []
  puts "Name:"
  name = gets.chomp
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp.downcase
    # if the user types nothing for cohort, default to Nov
      if cohort == ""
        cohort = "november"
      end
    puts "Check your answer, type yes for correct, type no to redo".center(75)
    puts "name = #{name}, cohort = #{cohort}".center(75)
    # only commit the information to the array if user is happy
    check = gets.chomp
    if check == "yes"
      students << {name: name, cohort: cohort.to_sym}
      if students.length == 1
        puts "Now we have 1 student".center(75)
      else
        puts "Now we have #{students.count} students".center(75)
      end
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
    puts "#{(index + 1)}. #{student[:name]} (#{student[:cohort]} cohort)".center(75)
  end
end
def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(75)
  else
    puts "Overall, we have #{students.count} great students".center(75)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
