require File.join(File.dirname(__FILE__), 'pygments/popen')


module Pygments
  class << self
    attr_accessor :python_path
  end

  # if this paths is not cool enough, set Pygments.python_path from GitLab evoronment.
  %w( python python2.7 python2.6 python2.5 python2 ).each do |python_path|
    if %x{#{python_path} --version 2>&1} =~ / 2\.[567]\.\d/
      @python_path = python_path
      break
    end
  end
  @python_path ||= "/usr/bin/env python"

  extend Pygments::Popen

  autoload :Lexer, 'pygments/lexer'
end
