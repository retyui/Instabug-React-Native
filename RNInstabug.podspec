require 'json'
package = JSON.parse(File.read('package.json'))
version = package["version"]

Pod::Spec.new do |s|
  s.name         = 'RNInstabug'
  s.version      = version
  s.summary      = package["description"]
  s.author       = package["author"]
  s.license      = package["license"]
  s.homepage     = package["homepage"]
  s.source       = { :git => "https://github.com/Instabug/instabug-reactnative.git", :tag => 'v' + version }
  s.source_files = 'ios/RNInstabug/*'
  s.platform     = :ios, "9.0"
  s.static_framework = true
  s.dependency 'React'
  s.dependency 'Instabug', '10.9.2'
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-framework "Instabug"'}
end
