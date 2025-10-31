# NS: ParticipationMedals



## Functions

### CheckJsonType -- `bool CheckJsonType(Json::Value@ value, const Json::Type desired, const string&in name, const bool warning = true)`

Simple function for checking if a given Json::Value@ is of the correct type.
Only shared to make the compiler happy.

### GetColorParticipationStr -- `string GetColorParticipationStr()`

Returns the Participation medal color as a string.

### GetColorParticipationVec -- `vec3 GetColorParticipationVec()`

Returns the Participation medal color as a vec3.

### GetColorStr -- `string GetColorStr()`

Returns the Participation medal color as a string.
Deprecated.

### GetColorVec -- `vec3 GetColorVec()`

Returns the Participation medal color as a vec3.
Deprecated.

### GetIcon32 -- `const UI::Texture@ GetIcon32()`

Returns the Participation medal icon (32x32).
Deprecated.

### GetIcon512 -- `const UI::Texture@ GetIcon512()`

Returns the Participation medal icon (512x512).
Deprecated.

### GetIconParticipation32 -- `const UI::Texture@ GetIconParticipation32()`

Returns the Participation medal icon (32x32).

### GetIconParticipation512 -- `const UI::Texture@ GetIconParticipation512()`

Returns the Participation medal icon (512x512).

### GetMaps -- `const dictionary@ GetMaps()`

Returns all cached map data.
Keys are map UIDs and values are of type ParticipationMedals::Map@.

### GetWMTime -- `uint GetWMTime()`

Gets the participation medal time for the current map.
If there is an error or the map does not have a Participation medal, returns 0.
This does not query the API for a time, so the plugin must already have it cached for this to return a time.
Only use this if you need a synchronous function.

### GetWMTime -- `uint GetWMTime(const string&in uid)`

Gets the participation medal time for a given map UID.
If there is an error or the map does not have a Participation medal, returns 0.
This does not query the API for a time, so the plugin must already have it cached for this to return a time.
Only use this if you need a synchronous function.

### GetWMTimeAsync -- `uint GetWMTimeAsync()`

Gets the participation medal time for the current map.
If there is an error or the map does not have a Participation medal, returns 0.
Queries the API for a medal time if the plugin does not have it cached.
Use this instead of the synchronous version if possible.

### GetWMTimeAsync -- `uint GetWMTimeAsync(const string&in uid)`

Gets the participation medal time for a given map UID.
If there is an error or the map does not have a Participation medal, returns 0.
Queries the API for a medal time if the plugin does not have it cached.
Use this instead of the synchronous version if possible.

### Map -- `Map@ Map()`

Data container for a map with a Participation medal.

### Map -- `Map@ Map(Json::Value@ map)`

Data container for a map with a Participation medal.

### Map -- `Map@ Map(Json::Value@ map, const string&in type)`

Data container for a map with a Participation medal.

### MonthName -- `string MonthName(const uint num)`

Simple function to get a month's name from its number.
Only shared to make the compiler happy.

### OpenplanetFormatCodes -- `string OpenplanetFormatCodes(const string&in s)`

Simple function to format a string for Openplanet's format codes and trim the string.
Only shared to make the compiler happy.

### StripFormatCodes -- `string StripFormatCodes(const string&in s)`

Simple function to strip a string of format codes and trim the string.
Only shared to make the compiler happy.



# Types/Classes

## ParticipationMedals::CampaignType (enum)

Enum describing the type a campaign is or the type of campaign a map is a part of.

- `Seasonal`
- `Weekly`
- `TrackOfTheDay`
- `Other`
- `Unknown`


## ParticipationMedals::CheckJsonType (class)

```angelscript_snippet
funcdef bool CheckJsonType(Json::Value@ value, const Json::Type desired, const string&in name, const bool warning = true);
```







## ParticipationMedals::GetColorParticipationStr (class)

```angelscript_snippet
funcdef string GetColorParticipationStr();
```







## ParticipationMedals::GetColorParticipationVec (class)

```angelscript_snippet
funcdef vec3 GetColorParticipationVec();
```







## ParticipationMedals::GetIconParticipation32 (class)

```angelscript_snippet
funcdef const UI::Texture@ GetIconParticipation32();
```







## ParticipationMedals::GetIconParticipation512 (class)

```angelscript_snippet
funcdef const UI::Texture@ GetIconParticipation512();
```







## ParticipationMedals::GetWMTime (class)

```angelscript_snippet
funcdef uint GetWMTime(const string&in uid);
```







## ParticipationMedals::GetWMTimeAsync (class)

```angelscript_snippet
funcdef uint GetWMTimeAsync(const string&in uid);
```







## ParticipationMedals::Map (class)

Data container for a map with a Participation medal.

### Functions

#### GetPB -- `void GetPB()`

#### GetPBAsync -- `void GetPBAsync()`

#### GetUrlAsync -- `void GetUrlAsync()`

#### PlayAsync -- `void PlayAsync()`

#### ReturnToMenuAsync -- `void ReturnToMenuAsync()`

#### SetPBFromAPI -- `void SetPBFromAPI(Json::Value@ json)`

#### set_author -- `void set_author(const uint a) property`

#### set_campaignId -- `void set_campaignId(const int c) property`

#### set_campaignName -- `void set_campaignName(const string&in c) property`

#### set_campaignType -- `void set_campaignType(const CampaignType c) property`

#### set_clubId -- `void set_clubId(const int c) property`

#### set_clubName -- `void set_clubName(const string&in c) property`

#### set_date -- `void set_date(const string&in d) property`

#### set_downloadUrl -- `void set_downloadUrl(const string&in d) property`

#### set_gold -- `void set_gold(const uint g) property`

#### set_id -- `void set_id(const string&in i) property`

#### set_loading -- `void set_loading(const bool l) property`

#### set_name -- `void set_name(const string&in n) property`

#### set_nameFormatted -- `void set_nameFormatted(const string&in n) property`

#### set_nameStripped -- `void set_nameStripped(const string&in n) property`

#### set_number -- `void set_number(const int n) property`

#### set_participation -- `void set_participation(const uint w) property`

#### set_pb -- `void set_pb(const uint p) property`

#### set_reason -- `void set_reason(const string&in r) property`

#### set_uid -- `void set_uid(const string&in u) property`

#### set_week -- `void set_week(const int w) property`

#### set_worldRecord -- `void set_worldRecord(const uint w) property`

### Properties

#### author -- `uint author`

#### campaignId -- `int campaignId`

#### campaignName -- `string campaignName`

#### campaignType -- `CampaignType campaignType`

#### clubId -- `int clubId`

#### clubName -- `string clubName`

#### date -- `string date`

#### downloadUrl -- `string downloadUrl`

#### gold -- `uint gold`

#### hasParticipation -- `bool hasParticipation`

#### id -- `string id`

#### index -- `int8 index`

private void set_index(uint8 i) { _index = i; }

#### loading -- `bool loading`

#### name -- `string name`

#### nameFormatted -- `string nameFormatted`

#### nameStripped -- `string nameStripped`

#### number -- `int number`

weekly only

#### participation -- `uint participation`

#### pb -- `uint pb`

#### reason -- `string reason`

#### uid -- `string uid`

#### week -- `int week`

weekly only

#### worldRecord -- `uint worldRecord`



## ParticipationMedals::MonthName (class)

```angelscript_snippet
funcdef string MonthName(const uint num);
```







## ParticipationMedals::OpenplanetFormatCodes (class)

```angelscript_snippet
funcdef string OpenplanetFormatCodes(const string&in s);
```







## ParticipationMedals::StripFormatCodes (class)

```angelscript_snippet
funcdef string StripFormatCodes(const string&in s);
```








