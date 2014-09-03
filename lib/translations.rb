require 'active_support/concern'


module Translations
  extend ActiveSupport::Concern
  included do
    extend ActiveModel::Translation
  end
end