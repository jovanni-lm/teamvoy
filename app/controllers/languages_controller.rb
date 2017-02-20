class LanguagesController < ApplicationController
  def index
    render html: concept('language/cell/index', programming_languages), layout: true
  end

  protect_from_forgery except: :search
  def search
    run Language::Search do |op|
      render js: concept('language/cell/index', op['model']).call(:append)
    end
  end

  private

  def programming_languages
    @programming_languages ||= Language.all
  end
end
