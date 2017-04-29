module NavbarHelper
  def navbar_menu(items)
    content_tag :ul do
      items.collect { |item| concat(menu_item(item)) }
    end
  end

  def menu_item(item)
    content_tag(:li, menu_link(item), class: menu_item_status_class(item))
  end

  def menu_item_status_class(item)
    controller_name.in?(item[:controllers]) ? 'active' : ''
  end

  def menu_link(item)
    link_to(item[:label].to_s, item[:path].to_s)
  end
end
