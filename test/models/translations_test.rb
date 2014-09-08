require 'test_helper'
require 'i18n'
I18n.load_path += Dir[Dir.pwd + '/config/locales/app.pt-BR.yml']
I18n.locale = 'pt-BR'
require 'person_ext/translations'

class TestTranslations < MiniTest::Test

  def setup
    Person.send(:include, PersonExt::Translations)
  end

  def test_that_human_attribute_name_is_correct
    assert_equal "Nome", Person.human_attribute_name('name')
  end

end