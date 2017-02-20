class Language
  class Search < Trailblazer::Operation
    step :search

    def search(options, params:)
      options['model'] = Language.find(params[:q])
    end
  end
end
