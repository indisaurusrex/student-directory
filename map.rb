def input_students
  puts "Please enter the names and cohorts of the students,".center(75)
  puts "To finish, hit return at 'Name:'".center(75)
  #create an empty array
  students = []
  # get the first name
  puts "Name:"
  name = gets.chomp
  while !name.empty? do
    puts "Cohort:"
    cohort = gets.chomp.downcase
    # if the user types nothing for cohort, default to Nov
      if cohort == ""
        cohort = "november"
      end
    # only commit the information to the array if user is happy
    puts "Check your answer, type yes for correct, type no to redo".center(75)
    puts "name = #{name}, cohort = #{cohort}".center(75)
    check = gets.chomp
    if check == "yes"
      students << {name: name, cohort: cohort.to_sym}
      # confirm how many students are in the array now
      if students.length == 1
        puts "Now we have 1 student".center(75)
      else
        puts "Now we have #{students.count} students".center(75)
      end
    end
    # get more students
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

def sort_into_cohorts(students)
# we want the array to have a subarray per cohort
# if the subarray for that cohort already exists, add to it
# if not, create a new one
# print the cohort subarray chosen

  cohorts = [["june", "india", "arav", "matthew"],["july", "sarah"]]
  students.map { |student| 
    if cohorts.include?("june") 
      puts "yep" 
    else
      puts "nope"
    end }
  #puts "Which cohort would you like to see?"
  # choice = gets.chomp.to_sym
end

# print how many students we have overall
# def print_footer(students)
#   if students.count == 1
#     puts "Overall, we have 1 great student".center(75)
#   else
#     puts "Overall, we have #{students.count} great students".center(75)
#   end
# end

students = input_students
print_header
sort_into_cohorts(students)
#print_footer(students)
# sort_into_cohorts
