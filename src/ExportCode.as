// c 2024-07-17
// m 2025-07-18

/*
Exports from the Participation Medals plugin.
*/
namespace ParticipationMedals {
    /*
    Returns the Participation medal color as a string.
    */
    string GetColorParticipationStr() {
        return pluginColor;
    }

    /*
    Returns the Participation medal color as a vec3.
    */
    vec3 GetColorParticipationVec() {
        return colorParticipationVec;
    }

    /*
    Returns the Participation medal icon (32x32).
    */
    const UI::Texture@ GetIconParticipation32() {
        if (iconParticipation32 is null) {
            IO::FileSource file("assets/participation_32.png");
            @iconParticipation32 = UI::LoadTexture(file.Read(file.Size()));
        }

        return iconParticipation32;
    }

    /*
    Returns the Participation medal icon (512x512).
    */
    const UI::Texture@ GetIconParticipation512() {
        if (iconParticipation512 is null) {
            IO::FileSource file("assets/participation_512.png");
            @iconParticipation512 = UI::LoadTexture(file.Read(file.Size()));
        }

        return iconParticipation512;
    }

    /*
    Returns all cached map data.
    Keys are map UIDs and values are of type ParticipationMedals::Map@.
    */
    const dictionary@ GetMaps() {
        return maps;
    }

    /*
    Gets the participation medal time for the current map.
    If there is an error or the map does not have a Participation medal, returns 0.
    This does not query the API for a time, so the plugin must already have it cached for this to return a time.
    Only use this if you need a synchronous function.
    */
    uint GetWMTime() {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
        ) {
            // warn("Participation Medals is disabled");
            return 0;
        }

        auto App = cast<CTrackMania>(GetApp());

        if (false
            or App.RootMap is null
            or App.Editor !is null
        ) {
            return 0;
        }

        return GetWMTime(App.RootMap.EdChallengeId);
    }

    /*
    Gets the participation medal time for a given map UID.
    If there is an error or the map does not have a Participation medal, returns 0.
    This does not query the API for a time, so the plugin must already have it cached for this to return a time.
    Only use this if you need a synchronous function.
    */
    uint GetWMTime(const string&in uid) {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
            or GetApp().Editor !is null
        ) {
            // warn("Participation Medals is disabled");
            return 0;
        }

        if (!maps.Exists(uid)) {
            // startnew(GetWMTimeAsync, uid);
            return 0;
        }

        auto map = cast<Map>(maps[uid]);
        return map !is null ? map.participation : 0;
    }

    /*
    Gets the participation medal time for the current map.
    If there is an error or the map does not have a Participation medal, returns 0.
    Queries the API for a medal time if the plugin does not have it cached.
    Use this instead of the synchronous version if possible.
    */
    uint GetWMTimeAsync() {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
        ) {
            // warn("Participation Medals is disabled");
            return 0;
        }

        auto App = cast<CTrackMania>(GetApp());

        if (false
            or App.RootMap is null
            or App.Editor !is null
        ) {
            return 0;
        }

        return GetWMTimeAsync(App.RootMap.EdChallengeId);
    }

    /*
    Gets the participation medal time for a given map UID.
    If there is an error or the map does not have a Participation medal, returns 0.
    Queries the API for a medal time if the plugin does not have it cached.
    Use this instead of the synchronous version if possible.
    */
    uint GetWMTimeAsync(const string&in uid) {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
            or GetApp().Editor !is null
        ) {
            // warn("Participation Medals is disabled");
            return 0;
        }

        if (!maps.Exists(uid)) {
            API::GetMapInfoAsync(uid);
        }

        if (!maps.Exists(uid)) {
            return 0;
        }

        auto map = cast<Map>(maps[uid]);
        return map !is null ? map.participation : 0;
    }

    // DEPRECATED EXPORTS /////////////////////////////////////////////////////////////////////////////////////////////

    /*
    Returns the Participation medal color as a string.
    Deprecated.
    */
    string GetColorStr() {
        return GetColorParticipationStr();
    }

    /*
    Returns the Participation medal color as a vec3.
    Deprecated.
    */
    vec3 GetColorVec() {
        return GetColorParticipationVec();
    }

    /*
    Returns the Participation medal icon (32x32).
    Deprecated.
    */
    const UI::Texture@ GetIcon32() {
        return GetIconParticipation32();
    }

    /*
    Returns the Participation medal icon (512x512).
    Deprecated.
    */
    const UI::Texture@ GetIcon512() {
        return GetIconParticipation512();
    }
}
