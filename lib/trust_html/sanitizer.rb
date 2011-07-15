# encoding: utf-8

require 'pty'
require 'v8'
require 'better/tempfile'

module TrustHtml
  # Test every URL in the HTML to make sure it is of a specific structure.
  # As in, make sure it is all on your domain, or all HTTPS, etc.
  #   Example of forcing HTTPS
  #   "if((new RegExp(\"^(https)?:\/\/\", \"ig\")).test(url)) { return url; }" + 
  #   'url' is local to the method
  URL_SANITIZER_METHOD_BODY = "return url;"

  # Test every ID to make sure it does not conflict (or just remove them all) etc.
  #   'id' is local to the method
  ID_SANITIZER_METHOD_BODY = "return id;"

  def self.sanitize_html(html_to_sanitize)
    sanitizer_js = "function urlX(url) {#{URL_SANITIZER_METHOD_BODY}};" + 
                   "function idX(id) {#{ID_SANITIZER_METHOD_BODY}};" + 
                   # Look at #escape_javascript as well...
                   # http://rails.rubyonrails.org/classes/ActionView/Helpers/JavaScriptHelper.html#M002239
                   "html_sanitize('#{html_to_sanitize.escape_single_quotes.remove_nonprintable}', urlX, idX);"

    cxt = V8::Context.new
    cxt.load(File.expand_path("../../../assets/html4-defs.js", __FILE__))
    cxt.load(File.expand_path("../../../assets/html-sanitizer.js", __FILE__))
    cxt.eval(sanitizer_js)
  end
end
