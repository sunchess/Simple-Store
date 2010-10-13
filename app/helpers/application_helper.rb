module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def draw_title
    if view_title?
      @view_title
    else
      String.new
    end    
  end

  def view_title?
    @view_title ||= String.new
    !@view_title.empty?
  end

  def admin_section(&block)
    return unless current_user?
    if current_user.admin?
     yield(block)  <<   " | "
    end
  end
  def bread_crumbs(options = {})
    return nil unless @bread_crumbs
    bc = @bread_crumbs.dup
    options[:delimiter] ||= ' / '
    options[:html] = true unless options.has_key?(:html)
    options[:skip_first] ||= false
    options[:skip_last] ||= false

    bc.shift if options[:skip_first]
    bc.pop if options[:skip_last]
    list = ""
    bc.each_with_index do |value,idx|
      if options[:html]
        list << options[:delimiter] unless idx == 0
        list << link_to(value[0], value[1], {:title=>value[0]})
      else
        list << options[:delimiter]
        list << value[0]
      end
    end
    if list.blank?
      list = options[:html] ?  content_tag('span', options[:delimiter]) : options[:delimiter]
    end
    list.html_safe
  end

  def content_mark(&block)
    raise ArgumentError, "Missing block" unless block_given?
  end
end
