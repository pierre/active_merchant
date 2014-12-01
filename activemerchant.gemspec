$:.push File.expand_path("../lib", __FILE__)
require 'active_merchant/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'aktivemerchant'
  s.version      = ActiveMerchant::VERSION
  s.summary      = 'Fork of the Shopify Active Merchant gem for Kill Bill.'
  s.description  = 'This fork contains unmerged pull requests for additional gateways.'
  s.license      = "MIT"

  s.author = 'Kill Bill core team'
  s.email = 'killbilling-users@googlegroups.com'
  s.homepage = 'http://killbill.io/'

  s.files = Dir['CHANGELOG', 'README.md', 'MIT-LICENSE', 'CONTRIBUTORS', 'lib/**/*', 'vendor/**/*']
  s.require_path = 'lib'

  s.has_rdoc = true if Gem::VERSION < '1.7.0'

  s.add_dependency('activesupport', '>= 3.2.14', '< 5.0.0')
  s.add_dependency('i18n', '>= 0.6.9')
  s.add_dependency('builder', '>= 2.1.2', '< 4.0.0')
  s.add_dependency('json', '~> 1.7')
  s.add_dependency('active_utils', '~> 2.2.0')
  s.add_dependency('nokogiri', "~> 1.4")
  s.add_dependency("offsite_payments", "~> 2.0.0")

  s.add_development_dependency('rake')
  s.add_development_dependency('mocha', '~> 0.13.0')
  s.add_development_dependency('rails', '>= 3.2.14')
  s.add_development_dependency('thor')
end
