module ApplicationHelper
  def icon_link_button(icon, link, options = {})
    link_to(raw("<i class='material-icons'>#{icon}</i>"), link, options)
  end

  def sweet_alert_delete(route, msg, options = {})
    default_options = sweet_alert_delete_params(msg)
    icon_link_button('delete', route, default_options.deep_merge(options))
  end

  def sweet_alert_delete_params(msg) # rubocop:disable Metrics/MethodLength
    {
      method: 'delete',
      data: {
        'sweet-alert-confirm': msg,
        'cancel-button-text': 'No way',
        'confirm-button-color': '#26A69A',
        'sweet-alert-type': 'warning',
        'confirm-button-text': 'Yes, delete it!',
        'allow-outside-click': true
      }
    }
  end
end
