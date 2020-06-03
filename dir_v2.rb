def input_students
  puts "Please enter the names and cohorts of the students,".center(75)
  puts "To finish, hit return at 'Name:'".center(75)
  #create an empty array
  students = []
  # get the first name
  puts "Name:"
  name = gets.gsub("\n", "")

  while !name.empty? do
    puts "Cohort:"
    cohort = gets.strip.downcase
    # if the user types nothing for cohort, default to Nov
      if cohort == ""
        cohort = "november"
      end
    # only commit the information to the array if user is happy

    puts "Check your answer, type yes if correct, type no to redo".center(75)
    puts "name = #{name}, cohort = #{cohort}".center(75)

    check = gets.chop
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
    name = gets.gsub("\n", "")
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(75)
  puts "-------------".center(75)
end

def print_students(students)
    students.each do |student|
      puts "#{student[:name]} : #{student[:cohort]} cohort".center(75)
    end
end

# print how many students we have overall
def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(75)
  else
    puts "Overall, we have #{students.count} great students".center(75)
  end
end

def interactive_menu
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more options later
    # read the input and save it as a variable
    selection = gets.chomp
    # do what the user has asked
    case selection
    when "1" 
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print_students(students)
      print_footer(students)
    when "9"
      exit # this will terminate the program
    else
      puts "I don't know what you mean, try again"
    end
  end
end

interactive_menu