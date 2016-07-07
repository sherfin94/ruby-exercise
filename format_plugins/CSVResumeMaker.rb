
require_relative 'ResumeMaker'
require 'CSV'


class CSVResumeMaker < ResumeMaker
  @output_format = "CSV"

  class << self
    attr_reader :output_format
  end

  def self.export(user_details, file_name)
    CSV.open(file_name, "w") do |csv|
      csv << [user_details['name'], user_details['age'], user_details['place']]
    end
  end
end
