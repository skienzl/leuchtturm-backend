module ApplicationHelper
  def active_link_to(name = nil, options = {}, html_options = {}, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def active_li_link_to(name = nil, options = {}, html_options = {}, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    content_tag(:li, link_to(name, options, html_options, &block), html_options)
  end
end
