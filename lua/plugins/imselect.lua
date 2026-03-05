return {
    -- im_select
    'keaising/im-select.nvim',
    config = function()
      require('im_select').setup {
        default_im_select = '1033',
        default_command = '~\\scoop\\apps\\im-select\\1.0.1\\im-select.exe',

        set_default_events = { 'VimEnter', 'FocusGained', 'InsertLeave' },
        set_previous_events = { 'FocusGained', 'InsertEnter' },

        async_switch_im = true,
      }
    end,
  }
