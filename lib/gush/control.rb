require "pathname"
require "thin"
require "sinatra/base"
require "coffee-script"
require "slim"
require "gush"
require "sinatra-websocket"
require "gush/control/version"
require "gush/control/app"
require "gush/control/cli_extension"
require "gush/control/log_sender"
require "gush/control/job"

module Gush
  module Control
    def self.rackup_path
      Pathname(__FILE__).dirname.parent.parent.join("config.ru")
    end
  end
end
