local KEY = "apostrophe"

local function processor(key_event, env)
    local engine = env.engine
    local schema = engine.schema
    local context = engine.context

    if key_event:release() or key_event:repr() ~= KEY then
        return 2
    end

    -- CUSTOM Begin
    -- if context:select(1) then
    if context:select(2) then
    -- CUSTOM End
        context:commit()
        return 1
    end


    if not env.engine.context:get_selected_candidate() then
        context:clear()
    else
        context:commit()
    end
    return 2
end

return { func = processor }
