function time = sampleTime(wave)
  % Return time array

  samples = length(wave.signal);
  time = (1:samples)/wave.fs;

end
