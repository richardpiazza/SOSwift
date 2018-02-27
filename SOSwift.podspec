Pod::Spec.new do |s|
  s.name = "SOSwift"
  s.version = "2.4.4"
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

  s.source = { :git => "https://github.com/richardpiazza/SOSwift.git", :tag => s.version.to_s }
  s.source_files = 'Sources/SOSwift/*'
  s.frameworks = 'Foundation'
  s.requires_arc = true
  s.dependency 'SOSwiftVocabulary', '~> 1.4.0'

  s.osx.deployment_target = "10.13"
  s.ios.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"
  s.watchos.deployment_target = "4.0"
end
