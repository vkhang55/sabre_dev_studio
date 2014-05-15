module SabreDevStudio
  module Helpers
    module DateExtensions
      # "2013-01-21"
      def self.make_date(str)
        Date.strptime(str, "%Y-%m-%d")
      end

      # "2013-01-21T17:00:00 -5"
      def self.make_time(str, gmt_offset)
        DateTime.strptime("#{str} #{gmt_offset}", "%Y-%m-%dT%H:%M:%S %z")
      end
    end
  end
end
