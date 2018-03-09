require 'active_record'

ActiveRecord::Base.establish_connection(YAML.load(File.read('db/config.yml'))['test'])

class Reservation < ActiveRecord::Base
    self.table_name = "reservations"

    validate :exclusive_reservation?

    def exclusive_reservation?
        result = true
        reserved = {}

        Reservation.pluck(:date_start, :date_end).each do |date_range|
            (date_range.first..date_range.second).each do |date| 
                reserved[date] = true
            end
        end

        if reserved.has_key? self.date_start
            errors.add(:date_start, 'it overlaps another reservation')
            result = false
        end

        if reserved.has_key? self.date_end
            errors.add(:date_end, 'it overlaps another reservation')
            result = false
        end

        result
    end
end
