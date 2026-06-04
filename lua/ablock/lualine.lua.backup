require('lualine').setup {
    options = {
        theme = 'catppuccin',
        component_separators = '',
        section_separators = ''
    },
    sections = {
        lualine_a = {
            {
                "mode",
                fmt = function(str)
                    local out = ""
                    for substr in string.gmatch(str, "[^%-]+") do
                        out = out .. substr:sub(1,1)
                    end
                    return out
                end
            }
        },
        lualine_b = { {'FugitiveHead', icon = ''}, },
        lualine_c = {
            {
                'buffers',
                buffers_color = {
                    active = { bg = '#e78284', fg='#000000' }
                }
            }
        }
    }
}

