on openInNotionApp()
  try
    tell application "Google Chrome"
      activate
      execute front window's active tab javascript "document.getElementsByClassName('notion-topbar-more-button')[0].click();"
      execute front window's active tab javascript "document.evaluate('//div[text() = \"Open in Mac app\"]', document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null ).snapshotItem(0).click()"
    end tell
  on error errMsg
      display dialog "ERROR: " & errMsg
  end try
end openInNotionApp

openInNotionApp()
