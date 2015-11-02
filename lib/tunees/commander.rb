module Tunees
  class Commander
    def self.run(script)
      IO.popen("osascript -l JavaScript", "r+") do |io|
        io.puts script
        io.close_write
        io.gets
      end
    end
  end
end
