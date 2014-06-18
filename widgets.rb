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


class ListWidget
  def initialize collection
    @collection = Array(collection)
  end

  def to_json
    {
      "item" => @collection.map do |item|
        GroupPresenter.new(item).to_widget
    end
    }.to_json
  end
end
