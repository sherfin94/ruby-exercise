require_relative 'resume_maker_template'

class PlainTextResumeMaker < ResumeMakerTemplate
  @output_format = 'Plain Text'
  @file_extension = 'txt'

  class << self
    attr_reader :output_format, :file_extension
  end

  def self.export(user_details, file_name)
    user_details_as_hash = user_details.to_hash
    File.open("#{file_name}.#{@file_extension}", 'w') do |file|
      file.write("
        Name : #{user_details_as_hash['name']}
        Age : #{user_details_as_hash['age']}
        Place : #{user_details_as_hash['place']}")
    end
  end
end
