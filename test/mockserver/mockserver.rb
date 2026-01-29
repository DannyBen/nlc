#!/usr/bin/env ruby
require "sinatra"
require "json"
require "mime/types"

MOCK_ROOT = File.expand_path("mocks", __dir__)
ASSET_ROOT = File.join(MOCK_ROOT, "assets")

set :bind, "0.0.0.0"
set :port, 3000
set :server, :puma
set :environment, :production

before do
  content_type "application/json"
end

helpers do
  def candidates(path, method)
    clean      = path.gsub(%r{/$}, "")     # remove trailing slash
    base       = File.basename(clean)      # last part of path
    dir        = File.dirname(clean)       # everything above basename
    method_tag = method.downcase           # "post", "get", etc.

    dir = "" if dir == "." # Normalize dir = "." → ""
    full_dir = dir.empty? ? MOCK_ROOT : "#{MOCK_ROOT}/#{dir}"

    [
      "#{full_dir}/#{method_tag}-#{base}.json",       # get-users.json
      "#{full_dir}/#{base}/#{method_tag}.json",       # users/get.json
      "#{full_dir}/#{base}.json",                     # users.json
    ]
  end

  # Return the first existing file among candidates
  def resolve_mock(path, method)
    candidates(path, method).find { |file| File.file?(file) }
  end

  # Detect and return static assets
  def resolve_asset(path)
    file = File.expand_path path, ASSET_ROOT
    # Prevent directory escape
    return nil unless file.start_with?(ASSET_ROOT)

    File.file?(file) ? file : nil
  end
end

# Route all HTTP verbs
%w[GET POST PUT PATCH DELETE OPTIONS].each do |verb|
  send(verb.downcase, "/*") do
    req_path = params["splat"].first

    # If an exact file exists under MOCK_ROOT, serve it directly
    exact = File.expand_path req_path, MOCK_ROOT

    # prevent directory traversal (only allow files inside MOCK_ROOT)
    if exact.start_with?(MOCK_ROOT) && File.file?(exact)
      content_type MIME::Types.type_for(exact).first.to_s
      return send_file exact
    end

    # Otherwise fall back to JSON mock resolver
    file = resolve_mock req_path, request.request_method
    return File.read file if file

    # Finally, we give up
    status 404
    return JSON.dump error: "No mock for #{request.request_method} #{request.path}"
  end
end
