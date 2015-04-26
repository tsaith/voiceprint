function frame = enframe(signal, size = 512, overlap = 128)

  y = signal;
  step = size - overlap;
  quantity = floor( (length(y)-overlap)/step );

  mat = zeros(size, quantity);
  for i = 1:quantity
    start_index = (i-1)*step + 1;
    mat(:, i) = y(start_index : (start_index + size - 1));
  end

  frame.mat = mat;
  frame.size = size;
  frame.quantity = quantity;
  frame.overlap = overlap;

end
