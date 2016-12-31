class Availability < ApplicationRecord

  def to_datetime_json
    JSON::parse(self.to_json).merge({
      "start": Time.zone.at(self.start),
      "end": Time.zone.at(self.end)
    })
  end

  def time_slots
    (self.start...self.end).step(3600).map do |i|
      Time.zone.at(i)
    end
  end
end
