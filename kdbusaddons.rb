# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Kdbusaddons < Formula
  desc "Addons to QtDBus"
  homepage "https://community.kde.org/Frameworks"
  url "https://download.kde.org/stable/frameworks/6.0/kdbusaddons-6.0.0.tar.xz"
  sha256 "11e70d0c7239bd818962d91cdb94aeba94748055c77003a4f64ff14dab0ae989"
  license all_of: ["LGPL-2.0-only", "LGPL-3.0-only"]

  depends_on "cmake" => :build
  depends_on "doxygen" => :build
  depends_on "extra-cmake-modules" => :build
  depends_on "qt"

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
    # software. Run the test with `brew test kdbusaddons`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
