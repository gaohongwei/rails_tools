#### API call
class ApiService < ApiBase
  def add(data)
    client.request(:post, url, app_params(data).to_json, com_header)
  end

  def list(page, size)
    client.request(:get, list_url, { page: page, size: size }, com_header)
  end

  def delete(id)
    client.request(:delete, url(id), {}, com_header)
  end
#### API parse
  read:200, create:201, delete: 204
  client error: 400 
  server error:400
  response = ApiService.new.list
  if response.status == 200
    JSON.parse(response.body).try(:[], '_some_key') || []
  else
    []
  end  
