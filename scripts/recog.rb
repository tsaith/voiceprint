load "../lib/voiceprint.rb"
require 'json'

include Voiceprint

def write_to_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_from_json(file)
  JSON.parse( IO.read(file) )
end

file_open = "../tmp/open.json"
file_open_cmp = "../tmp/open_cmp.json"
file_close = "../tmp/close.json"

signal_open = read_from_json(file_open)
signal_open_cmp = read_from_json(file_open_cmp)
signal_close = read_from_json(file_close)

puts Recog::signal_match(signal_open, signal_open_cmp)
