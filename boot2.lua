--[[

Turtle bootstrap 2

Grab more programs from github

Usage:
    > github get carterschieffer/computercraft/master/boot2.lua boot2
    > boot2

--]]

http_runs = {
    github = {
        -- utilities
        ['carterschieffer/computercraft/master/utils.lua'] = 'utils'
    }
}

for service, list in pairs(http_runs) do
    for id, program in pairs(list) do
        print('Downloading '..program..' from '..service)
        shell.run(service, "get", id, program)
    end
end