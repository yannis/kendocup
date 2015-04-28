module Kendocup
  module ApplicationHelper
    def title(content, options={page_title: true, meta_title: true})
      content_for(:title) {content} if options[:page_title]
      content_for(:header_title){ content_tag( :header, content_tag(:h1, content))} if options[:meta_title]
    end
  end
end
