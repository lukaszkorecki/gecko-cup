class ApiClient
  attr_reader :root

  def initialize
    @root = "http://worldcup.sfg.io"
  end

  def group_results
    parse connection.get "/group_results"
  end

  def matches at=""
    parse connection.get "/matches/#{at}"
  end


  private
  def parse respo
    JSON.parse respo.body
  end

  def connection
    @conn ||= Faraday.new url: root
  end
end


