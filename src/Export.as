// c 2024-07-17
// m 2025-07-18

/*
Exports from the Participation Medals plugin.
*/
namespace ParticipationMedals {
    /*
    Returns the Participation medal color as a string.
    */
    import string GetColorParticipationStr() from "ParticipationMedals";

    /*
    Returns the Participation medal color as a vec3.
    */
    import vec3 GetColorParticipationVec() from "ParticipationMedals";

    /*
    Returns the Participation medal icon (32x32).
    */
    import const UI::Texture@ GetIconParticipation32() from "ParticipationMedals";

    /*
    Returns the Participation medal icon (512x512).
    */
    import const UI::Texture@ GetIconParticipation512() from "ParticipationMedals";

    /*
    Returns all cached map data.
    Keys are map UIDs and values are of type ParticipationMedals::Map@.
    */
    import const dictionary@ GetMaps() from "ParticipationMedals";

    /*
    Gets the participation medal time for the current map.
    If there is an error or the map does not have a Participation medal, returns 0.
    This does not query the API for a time, so the plugin must already have it cached for this to return a time.
    Only use this if you need a synchronous function.
    */
    import uint GetWMTime() from "ParticipationMedals";

    /*
    Gets the participation medal time for a given map UID.
    If there is an error or the map does not have a Participation medal, returns 0.
    This does not query the API for a time, so the plugin must already have it cached for this to return a time.
    Only use this if you need a synchronous function.
    */
    import uint GetWMTime(const string&in uid) from "ParticipationMedals";

    /*
    Gets the participation medal time for the current map.
    If there is an error or the map does not have a Participation medal, returns 0.
    Queries the API for a medal time if the plugin does not have it cached.
    Use this instead of the synchronous version if possible.
    */
    import uint GetWMTimeAsync() from "ParticipationMedals";

    /*
    Gets the participation medal time for a given map UID.
    If there is an error or the map does not have a Participation medal, returns 0.
    Queries the API for a medal time if the plugin does not have it cached.
    Use this instead of the synchronous version if possible.
    */
    import uint GetWMTimeAsync(const string&in uid) from "ParticipationMedals";

    // DEPRECATED EXPORTS /////////////////////////////////////////////////////////////////////////////////////////////

    /*
    Returns the Participation medal color as a string.
    Deprecated.
    */
    import string GetColorStr() from "ParticipationMedals";

    /*
    Returns the Participation medal color as a vec3.
    Deprecated.
    */
    import vec3 GetColorVec() from "ParticipationMedals";

    /*
    Returns the Participation medal icon (32x32).
    Deprecated.
    */
    import const UI::Texture@ GetIcon32() from "ParticipationMedals";

    /*
    Returns the Participation medal icon (512x512).
    Deprecated.
    */
    import const UI::Texture@ GetIcon512() from "ParticipationMedals";

}
