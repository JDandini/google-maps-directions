use_frameworks!
# ignore all warnings from all pods
inhibit_all_warnings!
platform :ios, '9.0'

def pods
  pod 'SwiftLint', '~> 0'
  pod 'GoogleMaps'
  pod 'Alamofire', '~> 4'
  pod 'Unbox', '~> 2'
end

target 'GoogleDirections' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  pods

  target 'GoogleDirectionsTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GoogleDirectionsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
