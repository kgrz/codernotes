require File.expand_path("../../lib/codernotes.rb", __FILE__)

describe "Codernotes::Config" do

  context "it should have reasonable defaults" do
    context "After initialization" do
      let(:codernotes_config) { Codernotes::Config.new }

      it("should create the folder") { codernotes_config.default_folder_exists? }
      it("should create the config file") { codernotes_config.default_config_file_exists? }

      Dir.rmdir("#{Dir.home(Etc.getlogin)}/.codernotes")
      FileUtils.remove_file("#{Dir.home(Etc.getlogin)}/.codernotesrc")
    end
  end
end
