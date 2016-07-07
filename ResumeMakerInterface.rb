require_relative 'ResumeMaker'

=begin
Exercise: [Develop the application using TDD and OO principles.]
First version: Design a command line application which takes a user’s Name, Age, etc to create a resumé in a .csv file format.
Second version: Extend the application to accept user choice to add the resumé details to a .pdf file.
Third version: Extend the application to accept user choice to create the resumé in any arbitrary file format.
=end

=begin

Plan
----
step 1 : Make a ResumeMakerInterface class, that can input data from user and output dummy output(for the time beign)
        This interface class will use the ResumeMaker class that are going to be implemented in the next steps, inorder to process
        the input data and produce real output instead of dummy output

step 2 : Make a ResumeMaker class. It should include the functionality store user details.
          It contains an export method that saves the data as text file.
step 3 : Make a CSVResumeMaker class that overrides the export method to print the data in CSV fomat.
step 4 : Make a PDFResumeMaker class that overrides the export method to print the data in pdf format.
step 5 : Add functionality to ResumeMakerInterface class , inorder to search the formatPlugins folder and lets the user decide which
          format to use. A formatPlugin is supposed to be a ruby file that extends the ResumeMaker class and add custom logic in the
          export method

=end

class ResumeMakerInterface
  def initialize

    @resume_makers = [ResumeMaker]
    @user_data = {}
    @chosen_resume_maker = @resume_makers[0] # Initially , chosen output maker is defaulted to ResumeMaker(plaintext)

    # TODO: Search for plugins and add them
  end

  def start
    while true
      choice = displayMenu

      case Integer(choice)
      when 1 then getData
      when 2 then chooseFormat
      when 3 then saveFile
      when 4 then return
      else puts "\nInvalid option"
      end

      #print "Would you like to continue(y/n) : "
      #break if gets == "n\n"
    end
  end

  def displayMenu
    system 'clear'
    puts "\nChoose an option"
    print "
        1. Enter data
        2. Choose format
        3. Export
        4. Quit

        Currently chosen format : #{@chosen_resume_maker.output_format}

        Your option : "
    gets
  end

  def getData
    system 'clear'

    print " Name : "
    @user_data["name"] = gets

    print " Age : "
    @user_data["age"] = Integer(gets)

    print " Place : "
    @user_data["place"] = gets
  end

  def chooseFormat
    system 'clear'
    @resume_makers.each_with_index do |resumeMaker, index|
      puts "\n\t#{index + 1}. #{resumeMaker.output_format}"
    end
    print "\n\n\tYour choice : "
    choice = Integer(gets)

    @chooseFormat = @resume_makers[choice]
  end

  def saveFile
    system 'clear'
    print "file name : "
    file_name = gets

    @chosen_resume_maker.export(@user_data, file_name)
  end

end
