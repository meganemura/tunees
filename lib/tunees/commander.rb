require 'execjs/runtimes/jxa'
ExecJS.runtime = ExecJS::Runtimes::JXA

module Tunees
  class Commander
    def self.run(script)
      ExecJS.exec(script)
    end
  end
end
