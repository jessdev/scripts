function Install-Npm {
    npm install
    # Now the hard Part, what is the default browser?
    $browser = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\OpenWithList").a
    # start the engines!
    Start-Process $browser -ArgumentList "https://www.reddit.com/"
}
