desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    target = File.join ENV['HOME'], ".#{file}"

    if File.exist? target
      if File.identical? file, target
        puts "identical ~/.#{file}"
      else
        backup_file file
        link_file file
      end
    else
      link_file file
    end
  end
end

def backup_file(file)
  puts "backup ~/.#{file} to ~/.#{file}.bkp"
  system %Q{mv "$HOME/.#{file}" "$HOME/.#{file}.bkp"}
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
