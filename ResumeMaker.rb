

class ResumeMaker

  @output_format = "Plain Text File"

  class << self
    attr_reader :output_format
  end

  def self.export(user_details, file_name)
    File.open(file_name, "w") do |file|
      file.write("
        Name : #{user_details['name']}
        Age : #{user_details['age']}
        Place : #{user_details['place']}")
    end
  end

end
