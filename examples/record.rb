load "../lib/voiceprint.rb"
load "../lib/voiceprint/stream.rb"
require 'pry'

include Voiceprint
include FFI::PortAudio

def write_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_json(file)
  JSON.parse( IO.read(file) )
end

# File name
file = "../data/test.json"

Recorder.init

recorder = Voiceprint::Recorder.new
recorder.start

at_exit {
  recorder.stop
  Recorder.finalize
}


sleep 0.2
puts "Start to record"
sleep 2

input = recorder.get_data

write_json(input, file)

puts "End of recording"
