function zcr = frame2zcr(frame)

  mat = frame.mat;
  quantity = frame.quantity;
  for i = 1:quantity
    mat(:,i) = mat(:,i) - round(mean(mat(:,i))); % Zero justification
  end
  zcr = sum(mat(1:end-1, :).*mat(2:end, :) < 0);

end
