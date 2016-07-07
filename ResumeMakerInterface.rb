

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

    @resume_makers = []

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

      print "Would you like to continue(y/n) : "
      break if gets == "n\n"
    end
  end

  def displayMenu
    puts "\nChoose an option"
    print "
        1. Enter data
        2. Choose format
        3. Export
        4. Quit

        Your option : "
    gets
  end

  def getData
  end

  def chooseFormat
  end

  def saveFile
  end

end
