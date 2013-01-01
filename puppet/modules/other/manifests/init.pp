class other 
{
    $packages = [
        "curl", 
        "git",
        "vim"
    ]
    
    package 
    { 
        $packages:
            ensure  => latest,
            require => Exec['apt-get update']
    }

    exec
    {
        'vim-config':
            command => 'git clone https://github.com/stephpy/vim-config.git /home/vagrant/.vim-config && ln -s /home/vagrant/.vim-config/.vim /home/vagrant/.vim && ln -s /home/vagrant/.vim-config/.vimrc /home/vagrant/.vimrc && mkdir /home/vagrant/.vim/bundle && git clone https://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle && sudo chown -R vagrant:vagrant /home/vagrant/.vim* && vim +BundleInstall +qa',
            require => Package['git']
    }
}
