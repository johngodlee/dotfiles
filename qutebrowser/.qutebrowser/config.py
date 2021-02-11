from qutebrowser.api import interceptor

config.load_autoconfig(False)

# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['never']

# Maximum time (in minutes) between two history items for them to be
# considered being from the same browsing session. Items with less time
# between them are grouped when being displayed in `:history`. Use -1 to
# disable separation.
# Type: Int
c.history_gap_interval = -1

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
c.new_instance_open_target = 'tab'

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is not set to `window`, this is ignored.
# Type: String
# Valid values:
#   - first-opened: Open new tabs in the first (oldest) opened window.
#   - last-opened: Open new tabs in the last (newest) opened window.
#   - last-focused: Open new tabs in the most recently focused window.
#   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = 'last-focused'

# Enable JavaScript only for some websites
# config.set('content.javascript.enabled', False)

# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '30%'

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 5000

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['open', '{}']

# CSS border value for hints.
# Type: String
c.hints.border = '2px solid black'

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = True

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {'bottom': 5, 'left': 5, 'right': 5, 'top': 5}

# Widgets in statusbar
c.statusbar.widgets = ["keypress", "url", "scroll", "history", "tabs", "progress"]

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'


# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Show favicons in the tab bar.
# Type: Bool
c.tabs.favicons.show = 'never' 

# Position of new tabs opened from another tab.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.related = 'next'

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 8, 'left': 5, 'right': 5, 'top': 8}

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'center'

# Format to use for the tab title. The following placeholders are
# defined:  * `{perc}`: Percentage as a string like `[10%]`. *
# `{perc_raw}`: Raw percentage, e.g. `10`. * `{title}`: Title of the
# current web page. * `{title_sep}`: The string ` - ` if a title is set,
# empty otherwise. * `{index}`: Index of this tab. * `{id}`: Internal
# tab ID of this tab. * `{scroll_pos}`: Page scroll position. *
# `{host}`: Host of the current web page. * `{backend}`: Either
# ''webkit'' or ''webengine'' * `{private}`: Indicates when private mode
# is enabled. * `{current_url}`: URL of the current web page. *
# `{protocol}`: Protocol (http/https/...) of the current web page.
# Type: FormatString
c.tabs.title.format = '{private} {index}: {current_title} - {host}'

c.tabs.indicator.width = 3

# Padding (in pixels) for tab indicators.
# Type: Padding
c.tabs.indicator.padding = {'bottom': 0, 'left': 0, 'right': 5, 'top': 0}

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = 'black'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#F2F2F2'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = 'lightgrey'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = 'black'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = 'lightgrey'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = 'black'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = 'darkgrey'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = 'black'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = 'black'

# Foreground color of the matched text in the completion.
# Type: QssColor
c.colors.completion.match.fg = '#ff4444'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = 'white'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = 'darkgrey'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = 'black'

# Foreground color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.fg = 'white'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = 'white'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = 'black'

# Font color for the matched part of hints.
# Type: QssColor
c.colors.hints.match.fg = 'lime'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#FFFFFF'

# Foreground color for prompts.
# Type: QssColor
c.colors.prompts.fg = 'black'

# Border used around UI elements in prompts.
# Type: String
c.colors.prompts.border = '1px solid gray'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = 'lightgrey'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = 'black'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = 'darkgrey'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#039B9A'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = 'white'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = '#b30000'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = 'black'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = 'darkgrey'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = 'black'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = 'orange'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = 'blue'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = 'black'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = 'black'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = 'black'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#555555'

# Color gradient start for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.start = 'black'

# Color gradient end for the tab indicator.
# Type: QtColor
c.colors.tabs.indicator.stop = 'black'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = 'black'

# Color gradient interpolation system for the tab indicator.
# Type: ColorSystem
# Valid values:
#   - rgb: Interpolate in the RGB color system.
#   - hsv: Interpolate in the HSV color system.
#   - hsl: Interpolate in the HSL color system.
#   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'rgb'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = 'black'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = 'lightgrey'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = 'black'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = 'lightgrey'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = 'black'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = 'darkgrey'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = 'black'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = 'darkgrey'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#ffffff'

c.fonts.default_family = ["Hack Nerd Font Mono"]

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '10pt'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '10pt'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '10pt'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '10pt'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '10pt'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '10pt'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '10pt'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs.selected = '10pt'
c.fonts.tabs.unselected = '10pt'

# bindings for normal mode
# Userscripts must be made executable
config.bind('<backspace>', 'back')
config.bind('gT', 'tab-prev')
config.bind('gt', 'tab-next')
config.unbind('q')
config.bind('qq', 'quit')
config.bind('<Meta-R>', 'reload')
config.bind('h', 'back')
config.bind('l', 'forward')
config.bind(',e', 'fullscreen')
config.bind(',z', 'spawn --userscript ~/.qutebrowser/userscripts/readability')
config.bind(',n', 'config-cycle content.user_stylesheets ~/.qutebrowser/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
config.bind(',m', 'hint --rapid links spawn open -a VLC.app {hint-url}')
config.bind(',d', 'enter-mode caret ;; yank selection ;; spawn ~/bin/scidownl_qb {clipboard}')

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'g': 'https://www.google.com/search?hl=en&q={}', 'st': 'https://stackexchange.com/search?q={}', 'y': 'https://www.youtube.com/results?search_query={}', 'hn': 'https://hn.algolia.com/?query={}', 's': 'https://scholar.google.co.uk/scholar?hl=en&as_sdt=0%2C5&q={}.&btnG='}

# The page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = '~/.qutebrowser/homepage/home.html'

c.tabs.last_close = 'close'


# Block Youtube ads
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()

interceptor.register(filter_yt)
