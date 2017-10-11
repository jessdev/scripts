function Install-Npm {
    # Determine the default browser
    $browser = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.html\OpenWithList").a
    # open the browser to reddit. This takes less time than npm install
    Start-Process $browser -ArgumentList "https://www.reddit.com/"
    npm install
}
