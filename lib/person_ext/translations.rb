require 'active_support/concern'


module PersonExt
  module Translations
    extend ActiveSupport::Concern
    included do
      extend ActiveModel::Translation
    end
  end
end