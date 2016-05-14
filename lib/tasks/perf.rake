require 'net/http'
require 'json'

Rails.logger = Logger.new(STDOUT)

namespace :perf do
  desc "automated performace testing"
  task :wpt do
    begin
      run_wpt
    rescue => err
      Rails.logger.error "Error executing `rake perf:wpt`\n
      #{err}"
    end
  end
end

def run_wpt
  endpoint = 'http://www.webpagetest.org/runtest.php'
  params = YAML.load(ERB.new(File.read("#{Rails.root}/config/wpt.yml")).result)

  uri = URI(endpoint)
  uri.query = URI.encode_www_form(params)
  http_response = Net::HTTP.get_response(uri)
  response = JSON.parse(http_response.body)

  if http_response.is_a?(Net::HTTPSuccess)
    Rails.logger.info "WebPageTest initialized successfully\n
    TEST ID: #{response['data']['testId']}\n
    USER URL: #{response['data']['userUrl']}\n
    JSON URL: #{response['data']['jsonUrl']}"
  else
    Rails.logger.error "WebPageTest Error\n
    Status Code: #{response['statusCode']}\n
    Status Text: #{response['statusText']}"
  end
end
