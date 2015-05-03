module Voiceprint
  class Stream
    include FFI::PortAudio

    def open(input, output, freq, frames, flags=API::NoFlag)
      @input, @output, @freq, @frames, @flags = input, output, freq, frames, flags
      @callback = nil
      @data = nil
      @stream = FFI::Buffer.new :pointer
      API.Pa_OpenStream(@stream, @input, @output, @freq, @frames, @flags, @callback, @data)
    end

    def start
      API.Pa_StartStream @stream.read_pointer
    end

    def close
      API.Pa_CloseStream @stream.read_pointer
    end

    def read(buffer, len)
      API.Pa_ReadStream(@stream, buffer, len)
      puts "read"
    end


  end
end
