require 'rails_helper'

RSpec.describe Api::MarkdownPreviewController, type: :controller do
  render_views

  it 'renders markdown' do
    get :preview, text: <<-MD.strip_heredoc
      # Header 1
      This is a paragraph
      ```js
      function() { alert('I am blocking!') }
      ```
    MD
    expect(response.body).to have_selector('html body'), 'render html'
    expect(response.body).to have_selector('h1'), 'render headers'
    expect(response.body).to have_selector('p'), 'render paragraphs'
  end

end
