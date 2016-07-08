class DataCollector
  def collect_data(fields)
    collected_data = {}
    fields.each do |field|
      print " #{field} : "
      collected_data[field] = gets
    end

    collected_data
  end
end
