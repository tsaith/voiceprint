function [result, corr_coef] = patternMatch(x, y, threshold = 0.8)
  % Inspect two patterns are matched or not

  corr_coef = corr(x, y);
  if corr_coef >= threshold
    result = true;
  else
    result = false;
  end

end
