# encoding: utf-8

require File.expand_path("../common", __FILE__)

module CarrierWave
  module Test
    ##
    # These are some assertions that can be used in Minitest tests, to simplify the testing
    # of uploaders.
    #
    module MiniTest::Assertions
      
      def assert_identical(expected, actual)
        assert FileUtils.identical?(actual.current_path, expected), "Expected #{ actual.current_path.inspect } to be identical to #{ expected.inspect }"
      end
      
      def assert_has_permissions(expected, actual)
        actual_perms = File.stat(actual.current_path).mode & 0777
        mssg = "Expected #{ actual.current_path.inspect } to have permissions #{ expected.to_s(8) }, but they were #{ actual_perms.to_s(8) }"
        assert_equal expected, actual_perms, mssg
      end
      
      def assert_has_directory_permissions(expected, actual)
        actual_perms = File.stat(File.dirname actual.current_path).mode & 0777
        mssg = "Expected #{ File.dirname(actual.current_path).inspect } to have permissions #{ expected.to_s(8) }, but they were #{ actual_perms.to_s(8) }"
        assert_equal expected, actual_perms, mssg
      end
      
      def assert_larger_than(expected, actual)
        width, height = expected
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        actual_height = image.height
        mssg = "expected #{ actual.current_path.inspect} to be larger than #{ width } by #{ height }, but it was #{ actual_width } by #{ actual_height }."
        assert (width > actual_width && height > actual_height), mssg
      end
      
      def refute_larger_than(expected, actual)
        width, height = expected
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        actual_height = image.height
        mssg = "expected #{ actual.current_path.inspect} to be no larger than #{ width } by #{ height }, but it was #{ actual_width } by #{ actual_height }."
        assert (width >= actual_width && height >= actual_height), mssg
      end
      
      def refute_larger_than(expected, actual)
        width, height = expected
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        actual_height = image.height
        mssg = "expected #{ actual.current_path.inspect} to be no larger than #{ width } by #{ height }, but it was #{ actual_width } by #{ actual_height }."
        assert (width >= actual_width && height >= actual_height), mssg
      end
      
      def assert_has_dimensions(expected, actual)
        width, height = expected
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        actual_height = image.height
        mssg = "expected #{ actual.current_path.inspect} to have an exact size of #{ width } by #{ height }, but it was #{ actual_width } by #{ actual_height }."
        assert (width == actual_width && height == actual_height), mssg
      end
      
      def assert_has_height(height, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_height = image.height
        mssg = "Expected #{ actual.current_path.inspect} to have a height of #{ height }, but it was #{ actual_height }."
        assert_equal height, actual_height, mssg
      end
      
      def assert_has_width(width, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        mssg = "Expected #{ actual.current_path.inspect} to have a width of #{ width }, but it was #{ actual_width }."
        assert_equal width, actual_width, mssg
      end
      
      def assert_wider(width, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        mssg = "Expected #{ actual.current_path.inspect} to be wider than #{ width }, but it is #{ actual_width }."
        assert_operator width, :<=, actual_width, msg = nil
      end
      
      def refute_wider(width, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_width = image.width
        mssg = "Expected #{ actual.current_path.inspect} not to be wider than #{ width }, but it is #{ actual_width }."
        assert_operator width, :>=, actual_width, msg = nil
      end
      
      def assert_taller(height, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_height = image.height
        mssg = "Expected #{ actual.current_path.inspect} to be taller than #{ height }, but it is #{ actual_height }."
        assert_operator height, :<=, actual_height, msg = nil
      end
      
      def refute_taller(height, actual)
        image = ImageLoader.load_image(actual.current_path)
        actual_height = image.height
        mssg = "Expected #{ actual.current_path.inspect} not to be taller than #{ height }, but it is #{ actual_height }."
        assert_operator height, :>=, actual_height, msg = nil
      end
      
    end # MiniTest::Assertions
    
    ##
    # These are some expectations (MiniTest::Spec) that can be used in Minitest tests, to simplify the testing
    # of uploaders.
    #
    module MiniTest::Expectations

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_identical
      #
      #    must_be_identical(object, message = nil)
      #
      # :method: must_be_identical
      infect_an_assertion :assert_identical, :must_be_identical

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_has_permissions
      #
      #    must_have_permissions(expected, message = nil)
      #
      # :method: must_have_permissions
      infect_an_assertion :assert_has_permissions, :must_have_permissions

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_has_directory_permissions
      #
      #    must_have_directory_permissions(expected, message = nil)
      #
      # :method: must_have_directory_permissions
      infect_an_assertion :assert_has_directory_permissions, :must_have_directory_permissions

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_larger_than
      #
      #    must_be_larger_than(expected, message = nil)
      #
      # :method: must_be_larger_than
      infect_an_assertion :assert_larger_than, :must_be_larger_than


      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_larger_than
      #
      #    wont_be_larger_than(expected, message = nil)
      #
      # :method: wont_be_larger_than
      infect_an_assertion :refute_larger_than, :wont_be_larger_than

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_has_dimensions
      #
      #    must_have_dimensions(expected, message = nil)
      #
      # :method: must_have_dimensions
      infect_an_assertion :assert_has_dimensions, :must_have_dimensions

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_has_height
      #
      #    must_have_height(height, message = nil)
      #
      # :method: must_have_height
      infect_an_assertion :assert_has_height, :must_have_height

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_has_width
      #
      #    must_have_width(width, message = nil)
      #
      # :method: must_have_width
      infect_an_assertion :assert_has_width, :must_have_width

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_wider
      #
      #    must_be_wider(width, message = nil)
      #
      # :method: must_be_wider
      infect_an_assertion :assert_wider, :must_be_wider

      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_wider
      #
      #    wont_be_wider(width, message = nil)
      #
      # :method: wont_be_wider
      infect_an_assertion :refute_wider, :wont_be_wider

      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_taller
      #
      #    must_be_taller(height, message = nil)
      #
      # :method: must_be_taller
      infect_an_assertion :assert_taller, :must_be_taller

      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_taller
      #
      #    wont_be_taller(height, message = nil)
      #
      # :method: wont_be_taller
      infect_an_assertion :refute_taller, :wont_be_taller
      
    end # MiniTest::Expectations
    
  end # Test
end # CarrierWave

