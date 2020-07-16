module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = 'SmithWebDev Portfolio | Portfolio Site'
    @seo_keywords = ' SmithWebDev Portfolio'
  end
end
