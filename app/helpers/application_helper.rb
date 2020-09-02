module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "success"
    when "error"
      "danger"
    when "alert"
      "warning"
    when "notice"
      "info"
    else
      flash_type.to_s
    end
  end

  def full_title(page_title = "")
    base_title = "Castme.com"

    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def admin?
    member_signed_in? && current_member.admin?
  end

  def author_of(resource)
    member_signed_in? && current_member.id == resource.member_id
  end

  def icon(icon, options = {})
    file = File.read("node_modules/bootstrap-icons/icons/#{icon}.svg")
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css "svg"
    if options[:class].present?
      svg["class"] += " " + options[:class]
    end
    if options[:width].present?
      svg["width"] = options[:width]
    end
    if options[:height].present?
      svg["height"] = options[:height]
    end
    doc.to_html.html_safe
  end
end
