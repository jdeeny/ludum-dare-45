local baton = require 'lib.baton'

return baton.new {
  controls = {
    -- Directions:  WASD, arrows, gamepad left stick, or gamepad d-pad
    left = {'key:left', 'key:a', 'axis:leftx-', 'button:dpleft'},
    right = {'key:right', 'key:d', 'axis:leftx+', 'button:dpright'},
    up = {'key:up', 'key:w', 'axis:lefty-', 'button:dpup'},
    down = {'key:down', 'key:s', 'axis:lefty+', 'button:dpdown'},

    -- Action buttons for Gamepad
    --           Y (alt swap)
    -- X (swap)              B (pour)
    --             A (action/throw)

    -- Supports several keysets:
    --   ZXC when using arrow keys
    --   JKL when using WASD
    --   UIO as alternate for WASD
    --   ,./ as alternate for WASD
    -- keyboard buttons arranged in order as: SWAP  ACTION  POUR

    -- [enter] is also an action key, for use in menu
    -- [esc] and start button are pause / unpause

    -- Action: activate menu item, serve drink, advance through screens
    action = { 'key:return', 'key:i', 'key:k', 'key:z', 'key:.', 'button:a', 'mouse:1' },

    -- Pour: exit menu, pour ingredient
    pour = { 'key:o', 'key:l', 'key:c', 'key:/', 'button:b', 'mouse:2' },

    -- Swap: switch hands
    swap = { 'key:u', 'key:j', 'key:x', 'key:,', 'key:space', 'button:x', 'button:y', 'mouse:3'},

    -- Pause
    pause = { 'key:escape', 'button:start' },

    -- Special for debugging
    jumptoend = { 'key:0' },
    skipwave = { 'key:9'},

    mb1 = { 'mouse:1' },
  },
  pairs = {
    move = { 'left', 'right', 'up', 'down' },
  },
  joystick = love.joystick.getJoysticks()[1],
}
