class MdController < ApplicationController
  def method_missing(meth, *args, &block)
    render_md(f = "#{@_prefixes[0]}/#{meth}.md")
  end
  def render_md(f = "#{@_prefixes[0]}/#{@_action_name}.md")
    doc= render_to_string :file=> f, :layout => false
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :space_after_headers => true)
    html= markdown.render(doc)
    render :text=> html, :layout => true
  end
end
