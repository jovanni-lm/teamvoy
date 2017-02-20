module Language::Cell
  class Index < Trailblazer::Cell
    include ActionView::Helpers::JavaScriptHelper

    private

    def designed_by(language)
      content_tag :ul do
        language.designed.map { |designed| content_tag(:li, designed) }.join.html_safe
      end
    end

    def append
      %{ $("#languages").replaceWith("#{j(render(:table))}") }
    end
  end
end
