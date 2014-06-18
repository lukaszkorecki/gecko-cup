class MatchPresenter
  attr_reader :d

  TEMPLATE = <<-TEMPLATE.gsub(/^\s+/,'')
    <%= d["home_team"]["country"] %> vs <%= d["away_team"]["country"] %><br />
    <%= d["home_team"]["goals"] %>:<%= d["away_team"]["goals"] %><br/>
    Match no: <%= d["match_number"] %>
    TEMPLATE

  def initialize match_data
    @d = match_data
  end

  def to_html
    ERB.new(TEMPLATE).result binding
  end
end

class GroupPresenter
  attr_reader :d

  TEMPLATE = <<-TEMPLATE.gsub(/^\s+/,'')
   Wins: <%= d["wins"] %> Draws: <%= d["draws"] %> Losses: <%= d["losses"] %>
  TEMPLATE
  def initialize group_data
    @d = group_data
  end

  def to_widget
    {
      "title" => { "text" => d["country"] },
      "description" => ERB.new(TEMPLATE).result(binding)
    }
  end
end


