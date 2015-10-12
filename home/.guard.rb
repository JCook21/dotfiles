notification :terminal_notifier
notification :tmux,
  display_message: true,
  timeout: 5,
  default_message_format: '%s >> %s',
  line_separator: ' > ',
  color_location: 'status-left-bg'
