# frozen_string_literal: true

# Presentation helpers for bibliography fields. BibTeX braces that protect
# capitalization are useful in copied citations, but should not be visible on
# the publications page. Mathematical expressions retain their braces.
module BibtexDisplayFilters
  MATH_EXPRESSION = /(\\\(.*?\\\)|\\\[.*?\\\]|\$+.*?\$+)/m

  def bibtex_display_title(input)
    input.to_s.split(MATH_EXPRESSION).each_with_index.map do |part, index|
      index.odd? ? part : clean_text_for_display(part)
    end.join
  end

  private

  def clean_text_for_display(text)
    previous = nil
    until text == previous
      previous = text
      text = text.gsub(/\{([^{}]*)\}/, '\\1')
    end
    text.gsub('--', '–')
  end
end

Liquid::Template.register_filter(BibtexDisplayFilters)
