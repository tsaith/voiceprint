module Voiceprint
  module Plot

    class << self

      def plot(*args, **opts)
        case args.size
        when 1
          y = args.first
          points = y.size
          x = []

          (1..points).each do |index|
            x.push(index)
          end
        when 2
          x = args.first
          y = args.last
        else
          raise "Invalid arguments!"
        end

        plot = Nyaplot::Plot.new
        df = Nyaplot::DataFrame.new({x:x, y:y})
        plot.add_with_df(df, :line, :x, :y)

        xlabel = opts[:xlabel] || "x"
        ylabel = opts[:ylabel] || "y"
        plot.x_label(xlabel)
        plot.y_label(ylabel)
        plot.show
      end

    end
  end
end
