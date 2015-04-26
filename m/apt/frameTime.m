function out = frameTime(frame, fs)

  out = ((0:frame.quantity-1)*(frame.size-frame.overlap) + 0.5*frame.size)/fs;

end
