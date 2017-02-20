class Language
  attr_reader :name, :type, :designed
  include DataSearch

  def initialize(params)
    @name     = params['Name']
    @type     = params['Type']
    @designed = separate_authors(params)
  end

  def separate_authors(params)
    params['Designed by'].split(', ')
  end

  def self.find(query)
    result = CustomSearch.new({ query: query, data: all })
    result.search_result
    result.sort_result
  end

  def self.all
    response = Net::HTTP.get(URI.parse(Rails.configuration.languages_json_data_url))
    JSON.parse(response).map { |item| new(item) }
  end
end
