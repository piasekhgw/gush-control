module Gush
  module Control
    class Job < SimpleDelegator
      def status
        case
        when failed_softly?
          'Skipped'
        when failed?
          'Failed'
        when finished?
          'Finished'
        when running?
          'Running'
        when enqueued?
          'Enqueued'
        else
          'Pending'
        end
      end
    end
  end
end
