class TextWidget
  def initialize collection
    @collection = Array(collection)
  end

  def to_json
    {
      "item" => @collection.map do |item|
        {
          "type" => 0,
          "text" => MatchPresenter.new(item).to_html
        }
      end
    }.to_json
  end
end


