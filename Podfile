# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
platform :ios, '13.0'

target 'ChatWebSocket' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Socket.IO-Client-Swift'


  # Pods for ChatWebSocket

  target 'ChatWebSocketTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ChatWebSocketUITests' do
    # Pods for testing
  end

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        # Do either this:
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        # or this:
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
end
