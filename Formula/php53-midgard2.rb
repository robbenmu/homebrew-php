require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Midgard2 < AbstractPhp53Extension
  init
  homepage 'http://www.midgard-project.org'
  head 'https://github.com/midgardproject/midgard-php5.git', :branch => 'ratatoskr'
  url 'https://github.com/midgardproject/midgard-php5/tarball/10.05.6'
  sha1 'b4e49d4e0b476db4a96b63c712fd9727a1538ea9'

  depends_on 'pkg-config' => :build
  depends_on 'midgard2'

  def install
    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/midgard2.so"
    write_config_file unless build.include? "without-config-file"
  end
end
