# README

### Handle Errors:

- https://github.com/driggl/jsonapi_errors_handler

### Pagination

- https://github.com/useo-pl/jsom-pagination

### Json APi

- https://github.com/jsonapi-serializer/jsonapi-serializer

### Json Api Example

- https://jsonapi.org/examples/#pagination

### User Oauth

- Visit https://github.com/octokit/octokit.rb
- go on your GitHb account and
  - go to `Settings`
  - go to `Developer Settings`
  - click on `New GitHub App`
  - Fillout the form (in the Homepage URL and the Callback URL, add `http://localhost:3000` if localhost )
  - click on `Create GitHub App`
  - from the a `client_id` and a `client_secret` should be created
- add this gem: `gem "octokit", "~> 4.0"`
- run `bundle`
- in your console, run: `GITHUB_LOGIN='CornetS28' GITHUB_PASSWORD='your password' rails c`
- check that your're logged in, run: `ENV['GITHUB_LOGIN']`
- Create a client, run: `client = Octokit::Client.new(login: ENV['GITHUB_LOGIN'], password: ENV['GITHUB_PASSWORD'])`
- use the client id and client_secret provided by GitHuh, run: `client = Octokit::Client.new(client_id: ENV['your-clinet-id'], client_secret: ENV['your-client-secret'])
