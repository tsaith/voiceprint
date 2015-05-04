module Voiceprint
  class Stream < FFI::PortAudio::Stream

    def process(input, output, frames, time_info, flags, data)
      tmp = input.read_array_of_int16(frames)
      data.write_array_of_int16(tmp)
    end

  end
end
