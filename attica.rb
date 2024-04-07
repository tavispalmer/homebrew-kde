# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Attica < Formula
  desc "Qt library that implements the Open Collaboration Services API"
  homepage "https://community.kde.org/Frameworks"
  url "https://download.kde.org/stable/frameworks/6.0/attica-6.0.0.tar.xz"
  sha256 "ef21d8e57aeae4757b6b40dfe0d0e9c38302a979164b4e4d493b631b7c023d23"
  license :any_of ["LGPL-2.0-only", "LGPL-3.0-only"]

  depends_on "cmake" => :build

  def install
    args = ["-DBUILD_TESTING=OFF",
            "-DBUILD_QCH=ON"]

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test attica`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
