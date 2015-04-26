function volume = wave2volume(wave, frame_size = 512, frame_overlap = 128)

  signal = wave.signal(:,1);
  frame = enframe(signal, frame_size, frame_overlap);
  volume = frame2volume(frame);

end
