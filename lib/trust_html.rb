#!/usr/bin/env ruby
# encoding: utf-8

# Author: Cary Dunn <cary.dunn@gmail.com>
# Copyright 2011 All rights reserved

#require 'rubygems'

# Include subclasses...
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module TrustHtml
end

require 'trust_html/sanitizer'
require 'trust_html/string_ext'
