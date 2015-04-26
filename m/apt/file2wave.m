function wave = file2wave(file)
  [wave.signal, wave.fs, wave.bits] = wavread(file);
  wave.signal = wave.signal(:,1);
end
