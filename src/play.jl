function play(file::AbstractString; loop = false)
    @assert isfile(file)
    args = ["-nodisp", "-v", "0", "-autoexit"]
    if loop
        append!(args, ["-loop", "9999"])
    end
    @debug "Running play command $(Cmd(vcat(exe, args, file)))"

    run(
        addenv(
            `$(ffplay()) $args $file`,
            "ALSA_CONFIG_PATH" => "/usr/share/alsa/alsa.conf",
            "ALSA_PLUGIN_DIR" => "/usr/lib/alsa-lib/",
        ),
        wait = false,
    )
end
