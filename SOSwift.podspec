#
# Be sure to run `pod lib lint SOSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = "SOSwift"
  s.version = "0.1.3"
  s.summary = "A swift implementation of Schema.org structured data vocabulary."
  s.description = <<-DESC
  Schema.org is a collaborative, community activity with a mission to create, maintain,
  and promote schemas for structured data on the Internet, on web pages, in email messages,
  and beyond. This library implements some of the core vocabulary in the Swift language.
                     DESC
  s.homepage = "https://github.com/richardpiazza/SOSwift"
  s.license = 'MIT'
  s.author = { "Richard Piazza" => "github@richardpiazza.com" }
  s.social_media_url = 'https://twitter.com/richardpiazza'

  s.osx.frameworks = 'Foundation'
  s.osx.deployment_target = "10.12"

  s.ios.frameworks = 'Foundation'
  s.ios.deployment_target = "10.0"

  s.tvos.frameworks = 'Foundation'
  s.tvos.deployment_target = "10.0"

  s.watchos.frameworks = 'Foundation'
  s.watchos.deployment_target = "3.0"

  s.source = { :git => "https://github.com/richardpiazza/SOSwift.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.default_subspec = 'Implementation'

  s.subspec 'SchemaOnly' do |sub|
    sub.frameworks = 'Foundation'
    sub.source_files = 'Sources/Schema.org/*', 'Sources/Schema.org/*/*'
  end

  s.subspec 'Implementation' do |sub|
    sub.frameworks = 'Foundation'
    sub.dependency 'SOSwift/SchemaOnly'
    sub.source_files = 'Sources/Implementation/*', 'Sources/Implementation/*/*'
  end
end
