require 'active_support/concern'

module PersonExt
  module Naming
    extend ActiveSupport::Concern
    included do
      extend ActiveModel::Naming
    end
  end
end


 
# # p Person.model_name.name == "Person"                # => true
# # p Person.model_name.singular == "person"            # => true
# # p Person.model_name.plural == "people"              # => true
# # p Person.model_name.element == "person"             # => true
# # p Person.model_name.human == "Person"               # => true
# # p Person.model_name.collection == "people"          # => true
# # p Person.model_name.param_key == "person"           # => true
# # p Person.model_name.i18n_key == :person             # => true
# # p Person.model_name.route_key == "people"           # => true
# # p Person.model_name.singular_route_key == "person"  # => true
