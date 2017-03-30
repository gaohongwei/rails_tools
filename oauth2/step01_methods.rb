########## deep_symbolize, string key => symbol key ##########
def deep_symbolize(options)
  hash = {}
  options.each do |key, value|
    hash[key.to_sym] = value.is_a?(Hash) ? deep_symbolize(value) : value
  end
  hash
end

options = {
  authorize_url: "authorize_url_value",
  token_url: "token_url_value",
  'nested' => { 'nested_a' => 'nested_a_value'}
}
h = deep_symbolize(options)

options = {
  authorize_url: "authorize_url_value",
  token_url: "token_url_value",
  nested: { nested_a: 'nested_a_value'}
}
########## options_for ##########
# options_for("authorize")
# authorize_options = [:read, :scope]
# read keys from authorize_options
# select the key if options[:scope] or  options[:read]
def options_for(option)
  hash = {}
  options.send(:"#{option}_options").select { |key| options[key] }.each do |key|
    hash[key.to_sym] = options[key]
  end
  hash
end
