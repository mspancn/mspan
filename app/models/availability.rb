class Availability < ApplicationRecord

  def to_datetime_json
    JSON::parse(self.to_json).merge({
      "start" => DateTime.strptime(self.start.to_s,'%s'),
      "end" => DateTime.strptime(self.end.to_s, '%s')
    })
  end

  def time_slots
    (self.start...self.end).step(3600).map do |i|
      DateTime.strptime(i.to_s,'%s')
    end
  end
end
