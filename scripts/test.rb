load "../lib/voiceprint.rb"
load "../lib/voiceprint/stream.rb"
require 'pry'

include Voiceprint
include FFI::PortAudio

freq = 44100
num_seconds = 2
frames = freq * num_seconds
format = API::Int16
num_buffers = freq * num_seconds / frames


API.Pa_Initialize

input = API::PaStreamParameters.new
input[:device] = API.Pa_GetDefaultInputDevice
input[:channelCount] = 1
input[:sampleFormat] = format
input[:suggestedLatency] = 0
input[:hostApiSpecificStreamInfo] = nil

buffer = FFI::MemoryPointer.new(:pointer, frames)

class TStream < FFI::PortAudio::Stream

  def process(input, output, frames, timeInfo, statusFlags, userData)
    array = input.read_array_of_int16(frames)
    userData.write_array_of_int16(array)
  end

end


stream = TStream.new
stream.open(input, nil, freq, frames, API::NoFlag, buffer )
stream.start

#(0 ... num_buffers).each do
#  stream.read(buffer, frames)
#end

at_exit { 
  stream.close
  API.Pa_Terminate
}

def write_to_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_from_json(file)
  JSON.parse( IO.read(file) )
end

s1 = frames.times.map {|e| e = rand}
s2 = frames.times.map {|e| e = rand}

file = "../tmp/input.json"

3.times do |i| 
  sleep num_seconds

  input = buffer.read_array_of_int16(frames)


  if i % 2 == 0
    s1 = input
  else
    s2 = input
  end

  write_to_json(input, file)

  result, corr_coeff = Recog.signal_match(s1, s2)

  puts "---"
  puts "i = #{i}"
  puts "result, corr_coeff = #{result}, #{corr_coeff}"

end

data = read_from_json(file)

puts data == input
