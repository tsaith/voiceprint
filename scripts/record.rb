load "../lib/voiceprint.rb"
load "../lib/voiceprint/stream.rb"
require 'pry'

include Voiceprint
include FFI::PortAudio

def write_to_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_from_json(file)
  JSON.parse( IO.read(file) )
end
file = "../tmp/close.json"


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

at_exit {
  stream.close
  API.Pa_Terminate
}


sleep 0.3
puts "Start to record"
sleep num_seconds

input = buffer.read_array_of_int16(frames)

write_to_json(input, file)

puts "End of recording"
