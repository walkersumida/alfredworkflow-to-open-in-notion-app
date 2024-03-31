on openInNotionApp()
  try
    set defaultBrowser to do shell script "defaults read \\
        ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure \\
        | awk -F'\"' '/http;/{print window[(NR)-1]}{window[NR]=$2}'"

    if defaultBrowser contains "chrome" then
      set defaultBrowser to "Google Chrome"
    else if defaultBrowser contains "brave" then
      set defaultBrowser to "Brave Browser"
    else
      display dialog "ERROR: unsupport browser"
      return
    end if

    if defaultBrowser = "Brave Browser" then
      tell application "Brave Browser"
        activate
        execute front window's active tab javascript "document.getElementsByClassName('notion-topbar-more-button')[0].click();"
        execute front window's active tab javascript "document.evaluate('//div[text() = \"Open in Mac app\"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null ).snapshotItem(0).click()"
      end tell

    else if defaultBrowser = "Google Chrome" then
      tell application "Google Chrome"
        activate
        execute front window's active tab javascript "document.getElementsByClassName('notion-topbar-more-button')[0].click();"
        execute front window's active tab javascript "document.evaluate('//div[text() = \"Open in Mac app\"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null ).snapshotItem(0).click()"
      end tell
    end if
  on error errMsg
      display dialog "ERROR: " & errMsg
  end try
end openInNotionApp

openInNotionApp()
