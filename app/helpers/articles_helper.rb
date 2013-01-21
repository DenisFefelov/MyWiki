module ArticlesHelper
  def markdown(text)
     renderer = MyWikiRenderer.new(hard_wrap: true, filter_html: true)
    options = {
        autolink: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        lax_html_blocks: true,
        strikethrough: true,
        superscript: true,
        space_after_headers: true,
        hard_wrap: true,
        filter_html: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  
  
  class MyWikiRenderer < Redcarpet::Render::HTML
    
    def get_slug(marked_text)
      
      txt = marked_text[/\[\[([^\]]*)\]\]/,1]
      puts txt
      "[#{txt}](/wiki/#{txt.parameterize.gsub('-', '+')})"
      
    end
    
    def preprocess(document)
      document.gsub!(/\[\[([^\]]*)\]\]/) do |marked_text|
        get_slug(marked_text)
      end
      document
    end
  end

end
