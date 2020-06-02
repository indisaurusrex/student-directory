def input_students
  puts "Please enter the names of the students, followed by their height and favourite hobby"
  puts "To finish, just hit return twice on an empty name"
  #create an empty array
  students = []
  # get the first name, height and favourite hobby
  puts "Name:"
  name = gets.chomp
  # while name is not empty, repeat this code
  while !name.empty? do
    puts "Height:"
    height = gets.chomp
    puts "Hobby:"
    hobby = gets.chomp
    #add the student hash to the array
    students << {name: name, cohort: :november, height: height, hobby: hobby}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts "Next name:"
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
  count = 0
  until count == students.length
    puts "#{(count + 1)}. #{students[count][:name]} (#{students[count][:cohort]} cohort)".center(75)
    puts "spends time doing #{students[count][:hobby]} and is #{students[count][:height]} tall".center(75)
    count += 1
  end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(75)
end

students = input_students
print_header
print(students)
print_footer(students)
