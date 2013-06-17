# encoding: utf-8

require File.expand_path("../common", __FILE__)

module CarrierWave
  module Test
    ##
    # Addtional carrierwave uploader assertions
    #
    module MiniTest::Assertions
        
      ### Addition   
      def assert_exists(actual)
        mssg = "Expected #{ actual.current_path.inspect} to exist."
        assert File.exists?(actual.current_path), mssg
      end
        
      def assert_basename_equals(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to have basename #{ expected }."
        assert_equal expected, File.basename(actual.current_path), mssg
      end
  
      def refute_basename_equals(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to not have basename #{ expected }."
        refute_equal expected, File.basename(actual.current_path), mssg
      end
  
      def assert_extension(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to have file extension #{ expected }."
        assert_equal expected, actual.file.extension, mssg
      end
  
      def refute_extension(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to have file extension #{ expected }."
        refute_equal expected, actual.file.extension, mssg
      end
  
      def assert_content_type(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to have file content_type #{ expected }."
        assert_equal expected, actual.file.content_type, mssg
      end
  
      def refute_content_type(expected, actual)
        mssg = "Expected #{ actual.current_path.inspect} to have file content_type #{ expected }."
        refute_equal expected, actual.file.content_type, mssg
      end
    end

    ##
    # Addtional carrierwave uploader expectations
    #

    module MiniTest::Expectations
    
      ### hishma additions ###
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_exists
      #
      #    must_exist(actual, message = nil)
      #
      # :method: must_exist
      infect_an_assertion :assert_exists, :must_exist, :unary
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_basename_equals
      #
      #    must_have_basename(expected, message = nil)
      #
      # :method: must_have_basename
      infect_an_assertion :assert_basename_equals, :must_have_basename
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_basename_equals
      #
      #    wont_have_basename(expected, message = nil)
      #
      # :method: must_have_basename
      infect_an_assertion :refute_basename_equals, :wont_have_basename
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_extension
      #
      #    must_have_extension(expected, message = nil)
      #
      # :method: must_have_extension
      infect_an_assertion :assert_extension, :must_have_extension
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_extension
      #
      #    wont_have_extension(expected, message = nil)
      #
      # :method: wont_have_extension
      infect_an_assertion :refute_extension, :wont_have_extension
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#assert_content_type
      #
      #    must_have_content_type(expected, message = nil)
      #
      # :method: must_have_content_type
      infect_an_assertion :assert_content_type, :must_have_content_type
  
      ##
      # See CarrierWave::Test::MiniTest::Assertions#refute_content_type
      #
      #    wont_have_content_type(expected, message = nil)
      #
      # :method: wont_have_content_type
      infect_an_assertion :refute_content_type, :wont_have_content_type
  
    end
  end
end
