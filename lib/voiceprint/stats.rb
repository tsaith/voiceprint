module Voiceprint
  module Stats

    def self.corr(x, y)
      # return the correlation coefficient
      corr_coef = GSL::Stats::correlation(x.to_gv, y.to_gv)
      corr_coef
    end

  end
end
