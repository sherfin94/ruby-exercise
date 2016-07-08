require_relative 'resume_maker_template'
require 'CSV'

class CSVResumeMaker < ResumeMakerTemplate
  @output_format = 'CSV'
  @file_extension = 'csv'

  class << self
    attr_reader :output_format, :file_extension
  end

  def self.export(user_details, file_name)
    user_details_as_hash = user_details.to_hash
    CSV.open("#{file_name}.#{@file_extension}", 'w') do |csv|
      csv << [
        user_details_as_hash['name'],
        user_details_as_hash['age'],
        user_details_as_hash['place']
      ]
    end
  end
end
