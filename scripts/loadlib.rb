
load "../lib/voiceprint.rb"
include Voiceprint


def write_json(obj, file)
  File.open(file,"w") {|f| JSON.dump(obj, f) }
end

def read_json(file)
  JSON.parse( IO.read(file) )
end


file = "../data/open.json"
file_cmp = "../data/open_cmp.json"
s = read_json(file)
s_cmp = read_json(file_cmp)
Plot.plot(s)
Plot.plot(s_cmp)
Recog::signal_match(s, s_cmp)
