// c 2025-06-27
// m 2025-07-18

#if DEPENDENCY_ULTIMATEMEDALSEXTENDED

class UME_Participation : UltimateMedalsExtended::IMedal {
    UltimateMedalsExtended::Config GetConfig() override {
        UltimateMedalsExtended::Config c;

        c.defaultName = "Participation";
        c.icon = pluginColor + Icons::Circle;
        c.iconOverlay = "\\$DB4" + Icons::CircleO;

        return c;
    }

    uint GetMedalTime() override {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
        ) {
            return 0;
        }

        return ParticipationMedals::GetWMTime();
    }

    bool HasMedalTime(const string&in uid) override {
        if (false
            or pluginMeta is null
            or !pluginMeta.Enabled
        ) {
            return false;
        }

        return ParticipationMedals::GetWMTime(uid) > 0;
    }

    void UpdateMedal(const string&in uid) override { }
}

#endif
