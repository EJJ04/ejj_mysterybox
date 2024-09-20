Config = {}

Config.MysteryBoxItems = {
    -- Example format:
    -- ['item_name'] = { min = minimum_quantity, max = maximum_quantity }

    ['black_money'] = { min = 1, max = 5 }, -- Black money reward between 1 and 5
    ['ammo'] = { min = 1, max = 5 },        -- Ammo reward between 1 and 5
    ['burger'] = { min = 1, max = 5 },      -- Burger reward between 1 and 5
    ['water'] = { min = 1, max = 5 }        -- Water reward between 1 and 5
}

-- Configuration for the notify settings
Config.Notify = {
    title = 'Mystery Box Reward',
    description = 'You received %s x%d',
    position = 'top-right', -- Can be: 'top-right', 'top-left', 'bottom-right', etc.
    duration = 5000,        -- Duration in milliseconds
    type = 'success',       -- Can be: 'inform', 'error', 'success', 'warning'
    icon = 'fas fa-gift',   -- Font Awesome icon
    iconColor = '#4CAF50',  -- Color for the icon (optional)
    showDuration = true     -- Whether or not to show the countdown timer
}

Config.ProgressBar = {
    duration = 5000, -- 5 seconds
    label = 'Opening Mystery Box...',
    useWhileDead = false,
    canCancel = false,
    disable = {
        car = true,
        move = false,
    },
    anim = {
        dict = 'anim@heists@box_carry@',
        clip = 'idle'
    },
    prop = {
        model = `hei_prop_heist_box`,
        bone = 60309,
        pos = vec3(0.025000, 0.080000, 0.255000),
        rot = vec3(-145.000000, 290.000000, 0.000000)
    }
}

Config.DiscordWebhook = 'YOUR_DISCORD_WEBHOOK_URL' -- Replace with your Discord webhook URL

Config.LogMessages = {
    reward = "Player: %s\nReceived: %s x%d",
    exploitAttempt = "Player: %s attempted to trigger the mysterybox event without having the item in their inventory.",
    rewardTitle = "Mystery Box Reward", -- Title for reward log
    exploitTitle = "Mystery Box Exploit Attempt", -- Title for exploit log
    footerText = "Mystery Box System" -- Footer text for all logs
}

Config.DropPlayerMessage = "Attempted to exploit the Mystery Box reward system."

Config.CheatKick = true -- Set to false if you don't want to kick cheaters