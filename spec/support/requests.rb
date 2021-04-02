module Requests
  JSON_HEADERS = {
    "Accept"        => "application/json",
    "Content-Type"  => "application/json",
    "HTTPS"         => "on",
  }.freeze

  def json_response
    @json_response ||= JSON.parse(response.body)
  end

  def json_get(*args)
    path, params = *args
    get(path, params: params, headers: JSON_HEADERS)
  end

  def json_post(*args)
    path, params = *args
    params = params.to_json
    post(path, params: params, headers: JSON_HEADERS)
  end

  def json_put(*args)
    path, params = *args
    put(path, params: params.to_json, headers: JSON_HEADERS)
  end

  def json_delete(*args)
    path, params = *args
    delete(path, params: params.to_json, headers: JSON_HEADERS)
  end
end
