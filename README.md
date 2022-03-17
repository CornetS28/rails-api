# README

### Handle Errors:

- https://github.com/driggl/jsonapi_errors_handler

### Pagination

- https://github.com/useo-pl/jsom-pagination

### Json APi

- https://github.com/jsonapi-serializer/jsonapi-serializer

### Json Api Example

- https://jsonapi.org/examples/#pagination

GITHUB_LOGIN='CornetS28' GITHUB_PASSWORD='your password' rails c

ENV['GITHUB_LOGIN']

client = Octokit::Client.new(login: ENV['GITHUB_LOGIN'], password: ENV['GITHUB_PASSWORD'])

client = Octokit::Client.new(client_id: ENV['Iv1.8fb7f0bad7474b7d'], client_secret: ENV['b3b11b3ea4031ac5eb3016d09d16f70adbe88692'])
