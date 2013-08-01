#require "codernotes/version"
require "etc"
require "yaml"
require "fileutils"

module Codernotes
  class Config

    DEFAULT_CONFIG_FILE = "#{Dir.home(Etc.getlogin)}/.codernotesrc"
    DEFAULT_FOLDER = "#{Dir.home(Etc.getlogin)}/.codernotes"

    attr_reader :conf

    def init
      create_default_config
      create_default_folder
      load_default_configuration
    end

    def create_default_folder
      Dir.mkdir(DEFAULT_FOLDER) unless default_folder_exists?
    end

    def create_default_config
      FileUtils.touch(DEFAULT_CONFIG_FILE) unless default_config_file_exists?
    end

    def load_default_configuration
      load_file(DEFAULT_CONFIG_FILE)
    end


    def load_file(file_location)
      @config ||= YAML.load_file(file_location)
    end

    def default_config_file_exists?
      File.exists?(DEFAULT_CONFIG_FILE)
    end

    def default_folder_exists?
      Dir.exists?(DEFAULT_FOLDER)
    end

  end

end
