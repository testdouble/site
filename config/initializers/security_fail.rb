#feel free to remove once we're later than 3.2.11
#https://groups.google.com/forum/#!topic/rubyonrails-security/61bkgvnSGTQ
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)