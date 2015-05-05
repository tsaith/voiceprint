load "../lib/voiceprint.rb"
require 'pry'

include Voiceprint

def write_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_json(file)
  JSON.parse( IO.read(file) )
end

# Voiceprints
prints = { "open" => { "file" => "../data/open.json"},
           "close" => { "file" => "../data/close.json"}, }

prints.each_key do |key|
  file = prints[key]["file"]
  prints[key]["signal"] = read_json file
end

Recorder.init

recorder = Voiceprint::Recorder.new
recorder.start

at_exit {
  recorder.stop
  Recorder.finalize
}


sleep 0.2
puts "Start to listen"
sleep 2

input = recorder.get_data

puts "End of listening"

file = "../data/test.json"
write_json(input, file)

# Match voiceprints
threshold = 0.8
key_matched = nil
prints.each_key do |key|
  signal = prints[key]["signal"]
  prob = Recog::signal_match(input, signal)
  puts "#{key}: probability is  #{prob}"
  key_matched = key if prob >= threshold
end

if key_matched
  puts "Your voice key is #{key_matched} "
else
  puts "There is no matched voice!"
end
