# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
ENV['SWIFT_VERSION'] = '4' # 设置swift本地库的版本

target 'SmartServiceCloud' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'HZFaceRecognition', :path => 'Lib/HZFaceRecognition', :modular_headers => true #人脸识别模块
  pod 'HZSwiftLib', :path => 'Lib/HZSwiftLib', :modular_headers => true
  pod 'HZOCLib', :path => 'Lib/HZOCLib', :modular_headers => true
  pod 'HZThemeManager', :path => 'Lib/HZThemeManager', :modular_headers => true  # 主题切换
  
  # Pods for SmartServiceCloud
  pod 'SDWebImage', '~> 5.13.0'
  pod 'MJRefresh', '~> 3.7.5'
  pod 'AFNetworking', '~> 4.0.1'
  pod 'MBProgressHUD', '~> 1.2.0'
  pod 'MJExtension', '~> 3.4.1'
  pod 'QMUIKit', '~> 4.4.3'
  pod 'Masonry', '~> 1.1.0'
  pod 'IQKeyboardManager', '~> 6.5.10'
  pod 'Then'
  pod 'SnapKit'

  target 'SmartServiceCloudTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SmartServiceCloudUITests' do
    # Pods for testing
  end

end
