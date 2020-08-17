class ServerLogParser
  def initialize(file_path)
    file_exists?(file_path)
    @file_path = file_path
  end

  private

    def file_exists?(file_path)
      unless File.exists? file_path
        raise "No such file or directory exits at #{file_path}" 
      end
    end
end