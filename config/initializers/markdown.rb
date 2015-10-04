class MarkdownPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language, options: { linenos: 'table' })
  end
end
