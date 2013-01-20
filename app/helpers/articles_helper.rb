module ArticlesHelper
  def markdown(text)
    #options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    #Redcarpet.new(text, *options).to_html.html_safe
    
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
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
end
