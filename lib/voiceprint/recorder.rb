module Voiceprint
  class Recorder
    include FFI::PortAudio

    def initialize(len_seconds=2, sample_rate=44100)
      @len_seconds = len_seconds || 2
      @sample_rate = sample_rate || 44100
      @frames = @sample_rate * @len_seconds
      @format = API::Int16
      @buffers = @sample_rate * @len_seconds / @frames
      @channels = 1
      @input = API::PaStreamParameters.new
      @input[:device] = API.Pa_GetDefaultInputDevice
      @input[:channelCount] = @channels
      @input[:sampleFormat] = @format
      @input[:suggestedLatency] = 0
      @input[:hostApiSpecificStreamInfo] = nil

      @data = FFI::MemoryPointer.new(:pointer, @frames)
      @stream = Voiceprint::Stream.new
    end

    def start
      @stream.open(@input, nil, @sample_rate, @frames, API::NoFlag, @data )
      @stream.start
    end

    def stop
      @stream.close
    end

    def get_data
      @data.read_array_of_int16(@frames)
    end

    def self.init
      API.Pa_Initialize
    end

    def self.finalize
      API.Pa_Terminate
    end
  end
end
