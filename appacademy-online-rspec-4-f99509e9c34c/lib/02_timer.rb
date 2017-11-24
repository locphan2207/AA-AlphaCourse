class Timer
  attr_accessor :seconds

  def initialize(seconds = 0)
    @seconds = seconds
  end
  
  def time_string
    hour = @seconds/3600 #this just saves the quotient
    min = (@seconds - hour*3600)/60
    sec = @seconds - hour*3600 - min*60
    # handling leading 0
    hour = "0" + hour.to_s if hour < 10
    min = "0" + min.to_s if min < 10
    sec = "0" + sec.to_s if sec < 10
    "#{hour}:#{min}:#{sec}"
  end 
end