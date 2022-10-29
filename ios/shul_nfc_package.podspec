#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint shul_nfc_package.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.dependency 'VYNFCKit'
  s.name             = 'shul_nfc_package'
  s.version          = '0.0.2'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'https://shullabs.in'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Shul Labs' => 'support@shullabs.in' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.weak_frameworks = 'CoreNFC'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
