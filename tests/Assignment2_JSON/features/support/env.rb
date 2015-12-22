require 'rubygems'
require 'net/http'

require 'json'

# These are web service call passwords that can be set or default to ''
$http_auth_name = (ENV['HTTPAUTH_USERNAME'] || '')
$http_auth_password = (ENV['HTTPAUTH_PASSWORD'] || '')

# List of URLs to access its defaulted but then possible to export a different address so it points to the cloud instead
$STUBJSON = (ENV['http://localhost:5000'] || '')
$STUBJSON = 'http://localhost:5000/'

# This function gets the json object
def get_title_register_json(title_number)
  uri = URI.parse($STUBJSON)
  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new('/' + title_number)
  request.basic_auth $http_auth_name, $http_auth_password
  #puts $STUBJSON + '/' + title_number    # Useful for debug purposes
  response = http.request(request)
  if (response.code != '200') then
    raise response.code + " " + response.message + " Error in getting JSON for: " + titleNumber
  end
  return response.body
end
