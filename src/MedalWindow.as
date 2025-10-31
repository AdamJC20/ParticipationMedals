// c 2024-07-24
// m 2025-07-18

void MedalWindow() {
    if (false
        or !S_MedalWindow
        or (true
            and S_MedalWindowHideWithGame
            and !UI::IsGameUIVisible()
        )
        or (true
            and S_MedalWindowHideWithOP
            and !UI::IsOverlayShown()
        )
        or !InMap()
    ) {
        return;
    }

    const string uid = cast<CTrackMania>(GetApp()).RootMap.EdChallengeId;
    if (!maps.Exists(uid)) {
        return;
    }

    auto map = cast<ParticipationMedals::Map>(maps[uid]);
    if (map is null) {
        return;
    }

    const float scale = UI::GetScale();

    int flags = UI::WindowFlags::AlwaysAutoResize | UI::WindowFlags::NoTitleBar;
    if (!UI::IsOverlayShown()) {
        flags |= UI::WindowFlags::NoMove;
    }

    if (UI::Begin(pluginTitle + "###participation-medal", S_MedalWindow, flags)) {
        const bool delta = true
            and S_MedalWindowDelta
            and map.pb != uint(-1)
        ;

        int cols = 2;
        if (S_MedalWindowName) {
            cols++;
        }
        if (delta) {
            cols++;
        }

        if (UI::BeginTable("##table-times", cols)) {
            UI::TableNextRow();

            UI::TableNextColumn();
            if (S_MedalWindowIcon) {
                UI::Image(iconParticipation32, vec2(scale * 16.0f));
            } else {
                UI::Text(pluginColor + Icons::Circle);
            }

            if (S_MedalWindowName) {
                UI::TableNextColumn();
                UI::Text("Participation");
            }

            UI::TableNextColumn();
            UI::Text(Time::Format(map.participation));

            if (delta) {
                UI::TableNextColumn();
                UI::Text((map.pb <= map.participation ? "\\$77F\u2212" : "\\$F77+") + Time::Format(uint(Math::Abs(map.pb - map.participation))));
            }

            UI::EndTable();
        }
    }
    UI::End();
}
