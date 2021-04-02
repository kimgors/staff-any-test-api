class Shift < ApplicationRecord

  def as_json(options={})
    options[:methods] = [:converted_start_time, :converted_end_time]
    super
  end

  def converted_start_time
    start_time.strftime("%H:%M")
  end

  def converted_end_time
    end_time.strftime("%H:%M")
  end
end
