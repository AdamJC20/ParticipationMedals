// c 2024-07-17
// m 2025-08-10

Campaign@[]         activeOtherCampaigns;
Campaign@[]         activeSeasonalCampaigns;
Campaign@[]         activeTotdMonths;
Campaign@[]         activeWeeklyWeeks;
Json::Value@        campaignIndices;
dictionary          campaigns;
Campaign@[]         campaignsArr;
Campaign@[]         campaignsArrRev;
const vec3          colorParticipationVec          = vec3(0.18f, 0.58f, 0.8f);
const bool          hasPlayPermission        = Permissions::PlayLocalMap();
UI::Texture@        iconParticipation32;
UI::Texture@        iconParticipation512;
nvg::Texture@       iconParticipationNvg;
ParticipationMedals::Map@ latestTotd;
bool                loading                  = false;
dictionary          maps;
dictionary          mapsById;
int64               nextParticipationRequest       = 0;
const string        pluginColor              = "\\$38C";
const string        pluginIcon               = Icons::Circle;
Meta::Plugin@       pluginMeta               = Meta::ExecutingPlugin();
const string        pluginTitle              = pluginColor + pluginIcon + "\\$G " + pluginMeta.Name;
ParticipationMedals::Map@ previousTotd;
const string        reqAgentStart            = "Openplanet / Net::HttpRequest / " + pluginMeta.ID + " " + pluginMeta.Version;
vec3[]              seasonColors;
Medal               selectedMedal            = Medal::Participation;
bool                settingTotals            = false;
uint                total                    = 0;
uint                totalParticipationHave         = 0;
uint                totalParticipationOther        = 0;
uint                totalParticipationOtherHave    = 0;
uint                totalParticipationSeasonal     = 0;
uint                totalParticipationSeasonalHave = 0;
uint                totalParticipationTotd         = 0;
uint                totalParticipationTotdHave     = 0;
uint                totalParticipationWeekly       = 0;
uint                totalParticipationWeeklyHave   = 0;
const string        uidSeparator             = "|participation-campaign|";

enum Medal {
    Participation
}

void Main() {
    startnew(API::CheckVersionAsync);

    OnSettingsChanged();
    startnew(API::GetAllMapInfosAsync);
    ParticipationMedals::GetIcon32();

    yield();

    IO::FileSource file("assets/participation_512.png");
    @iconParticipationNvg = nvg::LoadTexture(file.Read(file.Size()));

    yield();

    startnew(PBLoop);
    startnew(WaitForNextRequestAsync);

#if DEPENDENCY_ULTIMATEMEDALSEXTENDED
    trace("registering UME medal");
    UltimateMedalsExtended::AddMedal(UME_Participation());
#endif

    bool inMap = InMap();
    bool wasInMap = false;

    while (true) {
        yield();

        inMap = InMap();

        if (wasInMap != inMap) {
            wasInMap = inMap;

            if (inMap) {
                API::GetMapInfoAsync();
            }
        }
    }
}

void OnDestroyed() {
#if DEPENDENCY_ULTIMATEMEDALSEXTENDED
    UltimateMedalsExtended::RemoveMedal("Participation");
#endif
}

void OnSettingsChanged() {
    seasonColors = {
        S_ColorWinter,
        S_ColorSpring,
        S_ColorSummer,
        S_ColorFall
    };
}

void Render() {
    if (iconParticipation32 is null) {
        return;
    }

    MainWindowDetached();
    MedalWindow();
    FeedbackWindow();
}

void RenderEarly() {
    DrawOverUI();
}

void RenderMenu() {
    if (UI::BeginMenu(pluginTitle)) {
        if (UI::MenuItem(pluginColor + Icons::WindowMaximize + "\\$G Detached main window", "", S_MainWindowDetached)) {
            S_MainWindowDetached = !S_MainWindowDetached;
        }

        if (UI::MenuItem(pluginColor + Icons::Circle + "\\$G Medal window", "", S_MedalWindow)) {
            S_MedalWindow = !S_MedalWindow;
        }

        UI::EndMenu();
    }
}

void PBLoop() {
    auto App = cast<CTrackMania>(GetApp());

    while (true) {
        sleep(500);

        if (false
            or App.RootMap is null
            or App.Editor !is null
            or !maps.Exists(App.RootMap.EdChallengeId)
        ) {
            continue;
        }

        auto map = cast<ParticipationMedals::Map>(maps[App.RootMap.EdChallengeId]);
        if (map !is null) {
            const uint prevPb = map.pb;

            map.GetPBAsync();

            if (prevPb != map.pb) {
                SetTotals();
            }
        }
    }
}

void SetTotals() {
    if (settingTotals) {
        return;
    }

    settingTotals = true;

    const uint64 start = Time::Now;
    trace("setting totals");

    total = maps.GetKeys().Length;
    totalParticipationHave         = 0;
    totalParticipationOther        = 0;
    totalParticipationOtherHave    = 0;
    totalParticipationSeasonal     = 0;
    totalParticipationSeasonalHave = 0;
    totalParticipationTotd         = 0;
    totalParticipationTotdHave     = 0;
    totalParticipationWeekly       = 0;
    totalParticipationWeeklyHave   = 0;

    for (uint i = 0; i < campaignsArr.Length; i++) {
        Campaign@ campaign = campaignsArr[i];
        if (campaign !is null) {
            const uint countParticipation = campaign.countParticipation;
            totalParticipationHave += countParticipation;

            switch (campaign.type) {
                case ParticipationMedals::CampaignType::Other:
                    totalParticipationOther += campaign.mapsArr.Length;
                    totalParticipationOtherHave += countParticipation;
                    break;

                case ParticipationMedals::CampaignType::Seasonal:
                    totalParticipationSeasonal += campaign.mapsArr.Length;
                    totalParticipationSeasonalHave += countParticipation;
                    break;

                case ParticipationMedals::CampaignType::TrackOfTheDay:
                    totalParticipationTotd += campaign.mapsArr.Length;
                    totalParticipationTotdHave += countParticipation;
                    break;

                case ParticipationMedals::CampaignType::Weekly:
                    totalParticipationWeekly += campaign.mapsArr.Length;
                    totalParticipationWeeklyHave += countParticipation;
                    break;
            }
        }
    }

    trace("setting totals done after " + (Time::Now - start) + "ms");
    settingTotals = false;
}

void WaitForNextRequestAsync() {
    while (true) {
        sleep(1000);

        if (true
            and nextParticipationRequest > 0
            and Time::Stamp - nextParticipationRequest > 0
        ) {
            trace("passed next request time, waiting to actually request...");
            sleep(300000);
            trace("auto-requesting maps...");
            API::GetAllMapInfosAsync();
        }
    }
}
