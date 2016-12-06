def option(name, value = nil)
  default_options[name] = value
end

def default_options
  return @default_options if instance_variable_defined?(:@default_options) && @default_options
  existing = superclass.respond_to?(:default_options) ? superclass.default_options : {}
  @default_options = OmniAuth::Strategy::Options.new(existing)
end
