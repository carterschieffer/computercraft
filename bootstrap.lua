--[[

Turtle bootstrap

A simple program to get a bunch of other programs in one run of 'pastebin get'

Usage:
    > pastebin get XXXXXXXX bootstrap
    > bootstrap

--]]

http_runs = {
    pastebin = {
        -- github loader
        caMmH484 = 'github',
    },
    -- make sure to use the right URL for raw.github.com
    github = {
        -- github bootstrap
        ['carterschieffer/computercraft/master/boot2.lua'] = 'boot2',
    },
}

for service, list in pairs(http_runs) do
    for id, program in pairs(list) do
        print('Downloading '..program..' from '..service)
        shell.run(service, 'get', id, program)
    end
end

-- run the bootstrapper from github
shell.run('boot2')