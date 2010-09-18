require 'i18n'

module I18nHook
  protected

  def t(str)
    I18n.t(str)
  end
end
