Pod::Spec.new do |s|
  s.name             = 'PanSdk'
  s.version          = '1.0.1'
  s.summary          = 'SDK para mostrar logo y formulario PAN'
  s.description      = 'Este SDK muestra una pantalla con un logo y un formulario de tarjeta de manera nativa.'
  s.homepage         = 'https://github.com/JuanRodriguezL/PanSdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Juan Rodríguez' => 'juangrl2143@gmail.com' }
  s.platform         = :ios, '12.0'
  s.source           = { :git => 'https://github.com/JuanRodriguezL/PanSdk.git', :tag => s.version.to_s }

  s.vendored_frameworks = 'PanSdk.xcframework'
  s.swift_version = '5.0'
  s.static_framework = false
end

