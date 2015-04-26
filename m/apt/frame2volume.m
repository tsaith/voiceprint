function volume = frame2volume(frame)

  quantity = frame.quantity;
  volume = zeros(quantity, 1);
  for i = 1:quantity
    mat = frame.mat(:,i);
    mat = mat - mean(mat); % zero-justified
    volume(i) = 10*log10(sum(mat.^2) + realmin); % Avoid negative infinity when there is no signal
  end

end
