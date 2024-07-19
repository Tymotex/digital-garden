---
title: Chrome
---

This page contains a personalised collection of shortcuts and extensions that speed up developer workflow.


```
// Tabs and windows
ctrl + t               // New tab
ctrl + shift + t       // Re-open last closed window or window
ctrl + n               // New window
ctrl + shift + n       // New incognito window
ctrl + w               // Close this tab
ctrl + tab             // Next tab
ctrl + shift + tab     // Previous tab
ctrl + 1-8             // Switch to tab by index 
alt + home             // Open homepage in current tab

shift + click a tab    // Selects multiple tabs, letting you tear them out as a group into a separate window

// History stack
alt + ←                // Back a page
alt + →                // Forward a page

// Bookmarks
ctrl + shift + b       // Toggle bookmarks UI
ctrl + d               // Bookmark the current tab

// Search 
ctrl + l               // Focus the top search bar
```

### Extensions
You can configure basic extension-specific shortcuts at **chrome://extensions/shortcuts**. 
- Eg. you can add `ctrl + shift + L` to toggle DarkReader on and off.
---
- [Rearrange Tabs](https://chrome.google.com/webstore/detail/rearrange-tabs/ccnnhhnmpoffieppjjkhdakcoejcpbga/related)
    ```json
    shift + alt + ←     // Move tab leftwards 
    shift + alt + →     // Move tab rightwards
    ```
- [Shortkeys](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck/related?hl=en)
    ```c
    alt + h                // Vim-like navigation to go back a page (equivalent to alt + ←).
    alt + l                // Vim-like navigation to go forward a page (equivalent to alt + →).
    alt + shift + h        // Vim-like binding for moving the current tab to the left.
    alt + shift + l        // Vim-like binding for moving the current tab to the right.
    
    ctrl + shift + d       // Duplicate the current tab.
    alt + shift + t        // Pop out the current tab into a new Chrome window.
    
    ctrl + shift + s       // Search for the currently selected text.
    ctrl + ,               // Open up extensions shortcuts page (why comma? Because ctrl + , opens the settings page in VSCode).
    ```
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en)
    ```json
    hjkl     // Scrolling
    gg       // Top of page
    G        // Bottom of pagejk
    o        // Quick search (like ctrl + l in Chrome)
    shift+o  // Search for tab in those that are currently opened
    shift+f  // Show shortcuts for accessing specific pages on Google search results
    yy       // Copy the current URL
    ```
- [Tab Pinner](https://chrome.google.com/webstore/detail/tab-pinner-keyboard-short/mbcjcnomlakhkechnbhmfjhnnllpbmlh?hl=en)
    ```json
    ctrl + shift + x     // Toggle pin/unpin the current tab
    ```
- [Tab to Window](https://chrome.google.com/webstore/detail/tab-to-windowpopup-keyboa/adbkphmimfcaeonicpmamfddbbnphikh?hl=en)
    ```json
    alt + x            // Pop out the current tab into a separate window
    alt + shift + x    // Linux alternative
    
    alt + z            // Transfer this tab to the next Chrome window
    alt + shift + z    // Linux alternative
    ```
- [YouTube Playback Speed Control](https://chrome.google.com/webstore/detail/youtube-playback-speed-co/hdannnflhlmdablckfkjpleikpphncik/related?hl=en)
    ```json
    // When the youtube player is in focus:
    +        // Increase speed by 1 increment 
    -        // Decrease speed by 1 increment
    ```
- [Redirector](https://chrome.google.com/webstore/detail/redirector/ocgpenflpmgnfapjedencafcfakcekcd)
    - This lets you set up rules where if you type certain URLs into the address bar, they’ll actually be converted to different URLs behind the scenes. 
    - Eg. On Google corporate laptops, if you type **c/** that’ll lead you to Google Calendar, if you type **m/** that’ll go to Gmail, etc. With this extension, you can set up similar rules.
    - Here’s my [configuration JSON](https://gist.github.com/Tymotex/4ab485feb814642b60c590c7508bac5f).
- [OCR image reader](https://chrome.google.com/webstore/detail/ocr-image-reader/bhbhjjkcoghibhibegcmbomkbakkpdbo/related?hl=en)
    - Lets you snip an image from the webpage, then run OCR on it to get the actual text. Useful for getting text on lecture slides, and from embedded images and videos.



