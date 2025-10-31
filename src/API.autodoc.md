# NS: API

## Child Namespaces

* API::Nadeo

## Functions

### CheckVersionAsync -- `void CheckVersionAsync()`

### EdevAgent -- `string EdevAgent()`

### GetAllMapInfosAsync -- `void GetAllMapInfosAsync()`

### GetAsync -- `Net::HttpRequest@ GetAsync(const string&in url, const bool start = true, const string&in agent = "")`

### GetCampaignIndicesAsync -- `bool GetCampaignIndicesAsync()`

### GetEdevAsync -- `Net::HttpRequest@ GetEdevAsync(const string&in endpoint, const bool start = true)`

### GetMapInfoAsync -- `void GetMapInfoAsync(const string&in uid)`

### GetMapInfoAsync -- `void GetMapInfoAsync()`

### PostAsync -- `Net::HttpRequest@ PostAsync(const string&in url, const string&in body = "", const bool start = true, const string&in agent = "")`

### PostEdevAsync -- `Net::HttpRequest@ PostEdevAsync(const string&in endpoint, const string&in body = "", const bool start = true)`

### SendFeedbackAsync -- `bool SendFeedbackAsync(const string&in subject, const string&in message, const bool anonymous = false)`

### TryGetCampaignIndicesAsync -- `void TryGetCampaignIndicesAsync()`

## Properties

### baseUrl -- `const string baseUrl`

### checkingUid -- `string checkingUid`

### missing -- `dictionary missing`

### requesting -- `bool requesting`

# Types/Classes

## API::EdevAgent (class)

```angelscript_snippet
funcdef string EdevAgent();
```







## API::GetAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ GetAsync(const string&in url, const bool start = true, const string&in agent = "");
```







## API::GetCampaignIndicesAsync (class)

```angelscript_snippet
funcdef bool GetCampaignIndicesAsync();
```







## API::GetEdevAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ GetEdevAsync(const string&in endpoint, const bool start = true);
```







## API::GetMapInfoAsync (class)

```angelscript_snippet
funcdef void GetMapInfoAsync(const string&in uid);
```







## API::PostAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ PostAsync(const string&in url, const string&in body = "", const bool start = true, const string&in agent = "");
```







## API::PostEdevAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ PostEdevAsync(const string&in endpoint, const string&in body = "", const bool start = true);
```









----------

# NS: API::Nadeo



## Functions

### GetAllPbsNewAsync -- `void GetAllPbsNewAsync()`

### GetAsync -- `Net::HttpRequest@ GetAsync(const string&in audience, const string&in url, const bool start = true)`

### GetCoreAsync -- `Net::HttpRequest@ GetCoreAsync(const string&in endpoint, const bool start = true)`

### PostAsync -- `Net::HttpRequest@ PostAsync(const string&in audience, const string&in url, const string&in body = "", const bool start = true)`

### PostLiveAsync -- `Net::HttpRequest@ PostLiveAsync(const string&in endpoint, const string&in body = "", const bool start = true)`

### WaitAsync -- `void WaitAsync()`

## Properties

### allCampaignsProgress -- `string allCampaignsProgress`

### allPbsNew -- `bool allPbsNew`

### allWeekly -- `bool allWeekly`

### audienceCore -- `const string audienceCore`

### audienceLive -- `const string audienceLive`

### cancel -- `bool cancel`

### lastRequest -- `uint64 lastRequest`

### minimumWait -- `const uint64 minimumWait`

### requesting -- `bool requesting`

# Types/Classes

## API::Nadeo::GetAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ GetAsync(const string&in audience, const string&in url, const bool start = true);
```







## API::Nadeo::GetCoreAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ GetCoreAsync(const string&in endpoint, const bool start = true);
```







## API::Nadeo::PostAsync (class)

```angelscript_snippet
funcdef Net::HttpRequest@ PostAsync(const string&in audience, const string&in url, const string&in body = "", const bool start = true);
```







## API::Nadeo::WaitAsync (class)

```angelscript_snippet
funcdef void WaitAsync();
```









