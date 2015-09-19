class StyleGuide::ExamplesController < ApplicationController

  EXAMPLE_PATH = Rails.root.join('app','views','style_guide','examples')

  def index
    authorize :style_guide, :index?
    @examples = {}
    Pathname.glob(EXAMPLE_PATH.join('_*.html.*')).each do |path|
      @examples[File.basename(path.basename('.*'), '.*')] = path
    end
  end

end
