#!/usr/bin/env ruby
# encoding: utf-8

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module TrustHtml
end

require 'trust_html/sanitizer'
require 'trust_html/string_ext'
