class other 
{
    $packages = [
        "curl", 
        "vim"
    ]
    
    package 
    { 
        $packages:
            ensure  => latest,
            require => Exec['apt-get update']
    }
}
