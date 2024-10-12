class AllegroAT4 < Formula
  url 'https://github.com/liballeg/allegro5/releases/download/4.4.3.1/allegro-4.4.3.1.tar.gz'
  homepage 'https://liballeg.org'
  sha256 'ec19dbc9a021244582b4819b3583ee594b50141f9fcf6944a4ed8069cbf8d4d4'

  depends_on 'cmake' => :build
  depends_on 'libvorbis' => :optional

  def install
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
