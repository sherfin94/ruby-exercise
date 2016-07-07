
require_relative 'ResumeMaker'
require 'Prawn'


class PDFResumeMaker < ResumeMaker
  @output_format = "PDF"

  class << self
    attr_reader :output_format
  end

  def self.export(user_details, file_name)
    pdf = Prawn::Document.new
    pdf.text user_details['name'], :font_size => 72, :justification => :center
    pdf.text user_details['age'].to_s, :font_size => 72, :justification => :center
    pdf.text user_details['place'], :font_size => 72, :justification => :center

    pdf.render_file file_name
  end
end
