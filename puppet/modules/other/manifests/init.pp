class other 
{
    $packages = [
        "curl", 
        "git"
    ]
    
    package 
    { 
        $packages:
            ensure  => latest,
            require => Exec['apt-get update']
    }
}
