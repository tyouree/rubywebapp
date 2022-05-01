module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # get message
  def get_message(message_type, screen_code, message_code)
    message = '[' + message_type + screen_code + message_code + ']' + t('err_messages.' + message_code)
    html_statement(message)
  end

  # generate message for views
  def html_statement(str)
    str.gsub(/\\n/, '<br />').html_safe
  end

  # generate message with parameter
  def message_with_parameter(message, str)
    message % str
  end

  # check whether string contains alphabet, number and hyphen
  def is_alphanumber_hyphen_valid?(str)
    return false if str.blank?
    regular_exp = /^[A-Za-z0-9\-]+$/
    unless regular_exp.match(str)
      return false
    end
    return true
  end

  # check whether text is valid alphanumber or symbol
  def is_alphanumberic_symbol_valid?(str)
    return false if str.blank?
    regular_exp = /^[0-9!-\~]+$/
    unless regular_exp.match(str)
      return false
    end
    return true
  end

end
