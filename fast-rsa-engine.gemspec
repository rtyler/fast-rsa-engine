#-*- mode: ruby -*-

Gem::Specification.new do |s|
  s.name = 'fast-rsa-engine'
  s.version = '0.2.0'
  s.author = 'Christian Meier'
  s.email = [ 'christian.meier@lookout.com', 'rtyler.croy@lookout.com' ]

  s.license = 'MIT'
  s.summary = %q(replaces the RSA signature and RSA ciphers from jruby-openssl by a faster implementation of them)
  s.homepage = 'https://github.com/lookout/fast-rsa-engine'
  s.description = %q(this gem replaces the RSA signature and RSA ciphers from jruby-openssl by a faster implementation of them. see https://corner.squareup.com/2014/02/faster-rsa-jnagmp.html)

  s.files = `git ls-files`.split($/)

  if RUBY_PLATFORM == 'java'
    unless defined?(BC_VERSION)
      BC_VERSION = '1.50'
    end
    s.platform = 'java'
    # needed for runtime
    s.requirements << "jar com.squareup.jnagmp:bouncycastle-rsa, 1.0.0"
    # needed for compilation
    s.requirements << "jar org.bouncycastle:bcpkix-jdk15on, #{BC_VERSION}, :scope => :provided"
    s.requirements << "jar org.bouncycastle:bcprov-jdk15on, #{BC_VERSION}, :scope => :provided"
    s.requirements << "pom org.jruby:jruby-core, 1.7.21, :scope => :provided"

    s.add_runtime_dependency 'jar-dependencies', '~> 0.1'
    s.add_development_dependency 'ruby-maven', '~> 3.3'
  end

  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rake', '~> 10.2'
end

# vim: syntax=ruby
