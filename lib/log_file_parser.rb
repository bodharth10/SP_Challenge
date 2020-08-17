class LogFileParser < ServerLogParser
  def parse_file
    logs = Hash.new {|hash, key| hash[key] = []}
    file = File.open(@file_path, "r")
    while line = file.gets
      request, ip = line.split(" ")
      (logs[request] ||= []) << ip 
    end
     return logs
     file.close
  end
end