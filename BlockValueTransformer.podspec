Pod::Spec.new do |s|
  s.name         = "BlockValueTransformer"
  s.version      = "1.0.0"
  s.summary      = "A block-based API for NSValueTransformer."
  s.homepage     = "https://github.com/azu/BlockValueTransformer"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "azu" => "info@efcl.info" }
  s.source       = {
    :git => "https://github.com/azu/BlockValueTransformer.git", 
    :tag => s.version.to_s
  }
  s.source_files  = 'BlockValueTransformer/*.{h,m}'
  s.requires_arc = true
end
