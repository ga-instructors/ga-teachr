class Api::MarkdownPreviewController < Api::ApplicationController

  def preview
    @text = Redcarpet::Markdown.new(MarkdownPygments, {
      fenced_code_blocks: true,
      tables: true,
      no_intra_emphasis: true
    }).render(params[:text]||"").html_safe
  end

end
