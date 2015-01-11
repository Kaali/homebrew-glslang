require "formula"

class Glslang < Formula
  homepage "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/"
  head "https://cvs.khronos.org/svn/repos/ogl/trunk/ecosystem/public/sdk/tools/glslang",
       :using => :svn
  depends_on "cmake" => :build

  def install
    system "mkdir", "build"
    cd "build" do
      system "cmake", ".."
      system "make", "install"
      bin.install "install/bin/glslangValidator"
      lib.install Dir["install/lib/*"]
    end
  end
end
