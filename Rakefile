task :install => [:update_submodules, :install_matcher] do
  root = File.expand_path(".")
  target = File.expand_path("~")
  File.read('Manifest').each_line do |file|
    file = file.chomp
    target_file = "#{target}/.#{file}"

    if File.exists?(target_file)
      print "Skipping #{file} - #{target_file} exists\n"
      next
    end

    print "Installing #{file}\n"
    File.symlink("#{root}/#{file}", target_file)
  end
end

task :update_submodules do
  print "Updating git submodules\n"
  `git submodule init`
  `git submodule update`
end

task :install_matcher do
  next if system("which matcher > /dev/null")
  `git clone git@github.com:burke/matcher.git && cd matcher && make && sudo make install`
  `rm -rf matcher`
end
