module DataSearch
  class CustomSearch
    attr_reader :query, :data, :result

    def initialize(params)
      @query = prepare_query(params[:query])
      @data = params[:data]
    end

    def prepare_query(search_query)
      search_query.downcase.split(/\s+/)
    end

    def search_result
      @result = data.find_all do |object|
        query.all? { |keyword| condition(attributes(object), keyword) }
      end
    end

    def sort_result
      return nil if result.nil?
      result.sort_by { |item| query.map { |keyword| keyword <=> attributes(item) } }
    end

    def condition(string, keyword)
      if keyword.start_with? '-'
        string.exclude? keyword[1..-1]
      else
        string.include? keyword
      end
    end

    def attributes(object)
      object.instance_values.map { |_k, v| v }.flatten.map(&:downcase).join(' ')
    end
  end
end
