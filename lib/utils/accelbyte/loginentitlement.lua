local base64 = require("lib/utils/base64")
local json = require("lib/utils/accelbyte/json")
local ClientId = Utility:get_current_client_id()
local ClientSecret = Utility:get_current_client_secret()
local BaseUrl = Utility:get_current_base_url()
local Namespace = Utility:get_current_namespace()
local PublisherNamespace = Utility:get_current_publisher_namespace()
local SteamPlatformId = "steam"
local IamSteamPlatformUrl = string.format("%s/iam/oauth/platforms/%s/token", BaseUrl, SteamPlatformId)
local EpicPlatformId = "epicgames"
local IamEpicPlatformUrl = string.format("%s/iam/v3/oauth/platforms/%s/token", BaseUrl, EpicPlatformId)
local IamServerUrl = string.format("%s/iam/oauth/token", BaseUrl)

if SystemInfo:distribution() == Idstring("EPIC") then
	IamServerUrl = string.format("%s/iam/v3/oauth/token", BaseUrl)
end

local LambdaUrl = Utility:get_current_lambda_url()
local publisher_user_id = nil
NamespaceRoles = {
	namespace = "",
	roleId = ""
}
Ban = {
	EndDate = "",
	Ban = "",
	Enabled = false,
	DisabledDate = "",
	TargetedNamespace = ""
}
Permission = {
	SchedCron = "",
	Action = 0,
	SchedAction = 0,
	Resource = "",
	SchedRange = {}
}
local PlayerSession = {
	scope = "",
	display_name = "",
	user_id = "",
	token_type = "",
	access_token = "",
	namespace_ = "",
	jflgs = "",
	xuid = "",
	refresh_token = "",
	platform_user_id = "",
	expires_in = "",
	bans = {},
	namespace_roles = {},
	permissions = {},
	roles = {}
}
Login = Login or class()
Login = {
	has_account = false,
	player_session = PlayerSession,
	SerializeJsonString = function (self, document)
		self.player_session.access_token = document.access_token
		self.player_session.display_name = document.display_name
		self.player_session.expires_in = document.expires_in
		self.player_session.jflgs = document.jflgs
		self.player_session.namespace_ = document.namespace
		self.player_session.platform_id = document.platform_id
		self.player_session.platform_user_id = document.platform_user_id
		self.player_session.refresh_token = document.refresh_token
		self.player_session.scope = document.scope
		self.player_session.token_type = document.token_type
		self.player_session.user_id = document.user_id
		self.player_session.xuid = document.xuid

		if document.bans ~= nil then
			for key = 1, table.getn(document.bans) do
				local ban = {
					Ban = document.bans[key].Ban,
					DisabledDate = document.bans[key].DisabledDate,
					Enabled = document.bans[key].Enabled,
					EndDate = document.bans[key].EndDate,
					TargetedNamespace = document.bans[key].TargetedNamespace
				}

				table.insert(self.player_session.bans, ban)
			end
		end

		if document.namespace_roles ~= nil then
			for key = 1, table.getn(document.namespace_roles) do
				local namespace_role = {
					namespace = document.namespace_roles[key].namespace,
					roleId = document.namespace_roles[key].roleId
				}

				table.insert(self.player_session.namespace_roles, namespace_role)
			end
		end

		if document.permissions ~= nil then
			for key = 1, table.getn(document.permissions) do
				local schedRange = {}

				if document.permissions[key].SchedRange ~= nil then
					for key2 = 1, table.getn(document.permissions[key].SchedRange) do
						table.insert(schedRange, document.permissions[key].SchedRange[key2])
					end
				end

				local permission = {
					Action = document.permissions[key].Action,
					Resource = document.permissions[key].Resource,
					SchedAction = document.permissions[key].SchedAction,
					SchedCron = document.permissions[key].SchedCron,
					SchedRange = schedRange
				}

				table.insert(self.player_session.permissions, permission)
			end
		end

		if document.roles ~= nil then
			for key = 1, table.getn(document.roles) do
				table.insert(self.player_session.roles, document.roles[key])
			end
		end
	end
}

function Login:LoginWithEpicToken(ticket, callback)
	cat_print("accelbyte", "[AccelByte] Login:LoginWithEpicToken")

	local payload_content_type = "application/x-www-form-urlencoded"
	local payload_body = {}
	local payload = "platform_token=" .. ticket
	local headers = {
		Authorization = "Basic " .. base64.encode(string.format("%s:%s", ClientId, ClientSecret)),
		Accept = "application/json"
	}

	local function login_callback(error_code, status_code, response_body)
		cat_print("accelbyte", "[AccelByte] Callback LoginWithEpicToken : " .. IamEpicPlatformUrl)
		cat_print("accelbyte", "[AccelByte] Error_code : " .. error_code .. (error_code == 1 and " OK" or ""))
		cat_print("accelbyte", "[AccelByte] Status_code : " .. status_code)
		cat_print("accelbyte", "[AccelByte] Response Body : " .. tostring(response_body))

		local response_json = response_body and json.decode(response_body) or {}

		Login:SerializeJsonString(response_json)
		cat_print("accelbyte", "[AccelByte] Display name : " .. tostring(self.player_session.display_name))

		if error_code == 1 and status_code == 200 and response_body ~= "" then
			cat_print("accelbyte", "[AccelByte] LoginWithEpicToken Success")
		else
			cat_print("accelbyte", "[AccelByte] LoginWithEpicToken Failed, try to relog on your epic to refresh the token")
		end

		callback(error_code, status_code, response_body)
	end

	HttpRequest:post(IamEpicPlatformUrl, login_callback, payload_content_type, payload, headers)
end

function Login:LoginWithSteamToken(ticket, callback)
	cat_print("accelbyte", "[AccelByte] Login:LoginWithSteamToken")

	local payload_content_type = "application/x-www-form-urlencoded"
	local payload_body = {}
	local payload = "platform_token=" .. ticket
	local headers = {
		Authorization = "Basic " .. base64.encode(string.format("%s:%s", ClientId, ClientSecret)),
		Accept = "application/json"
	}

	local function login_callback(error_code, status_code, response_body)
		cat_print("accelbyte", "[AccelByte] Callback LoginWithSteamToken : " .. IamSteamPlatformUrl)
		cat_print("accelbyte", "[AccelByte] Error_code : " .. error_code .. (error_code == 1 and " OK" or ""))
		cat_print("accelbyte", "[AccelByte] Status_code : " .. status_code)

		local response_json = nil

		if response_body then
			cat_print("accelbyte", "Response Body : " .. response_body)

			response_json = json.decode(response_body)

			Login:SerializeJsonString(response_json)
		end

		cat_print("accelbyte", "[AccelByte] Display name : " .. tostring(self.player_session.display_name))

		if error_code == 1 and status_code == 200 and response_body ~= "" then
			cat_print("accelbyte", "[AccelByte] LoginWithSteamToken Success")
		else
			cat_print("accelbyte", "[AccelByte] LoginWithSteamToken Failed, try to relog on your steam to refresh the token")
		end

		callback(error_code, status_code, response_body)
	end

	HttpRequest:post(IamSteamPlatformUrl, login_callback, payload_content_type, payload, headers)
end

function Login:LoginWithUsernamePassword(username, password)
	cat_print("accelbyte", "[AccelByte] Login:LoginWithUsernamePassword")

	local payload_content_type = "application/x-www-form-urlencoded"
	local payload_body = {}
	local payload = string.format("grant_type=password&username=%s&password=%s", username, password)
	local headers = {
		Authorization = "Basic " .. base64.encode(string.format("%s:%s", ClientId, ClientSecret)),
		Accept = "application/json"
	}

	local function callback(error_code, status_code, response_body)
		cat_print("accelbyte", "[AccelByte] Callback LoginWithUsernamePassword : " .. IamServerUrl)
		cat_print("accelbyte", "[AccelByte] Error_code : " .. error_code .. (error_code == 1 and " OK" or ""))
		cat_print("accelbyte", "[AccelByte] Status_code : " .. status_code)
		cat_print("accelbyte", "[AccelByte] Response Body : " .. response_body)

		local response_json = json.decode(response_body)

		Login:SerializeJsonString(response_json)
		cat_print("accelbyte", "[AccelByte] Display name : " .. tostring(self.player_session.display_name))
	end

	HttpRequest:post(IamServerUrl, callback, payload_content_type, payload, headers)
end

function Login:LoginWithClientCredentials(callback)
	cat_print("accelbyte", "[AccelByte] Login:LoginWithClientCredentials")

	local payload_content_type = "application/x-www-form-urlencoded"
	local payload_body = {}
	local payload = string.format("grant_type=client_credentials")
	local headers = {
		Authorization = "Basic " .. base64.encode(string.format("%s:%s", ClientId, ClientSecret)),
		Accept = "application/json"
	}

	local function credentials_callback(error_code, status_code, response_body)
		cat_print("accelbyte", "[AccelByte] Callback LoginWithClientCredentials : " .. IamServerUrl)
		cat_print("accelbyte", "[AccelByte] Error_code : " .. error_code .. (error_code == 1 and " OK" or ""))
		cat_print("accelbyte", "[AccelByte] Status_code : " .. status_code)

		local response_body_str = response_body or ""

		cat_print("accelbyte", "[AccelByte] Response Body : " .. response_body_str)

		local response_json = response_body and json.decode(response_body_str) or false

		if response_json then
			Login:SerializeJsonString(response_json)
		end

		if status_code == 200 then
			cat_print("accelbyte", "[AccelByte] Successfully Created Bearer Token for Client Credentials")
			callback(true)
		else
			cat_print("accelbyte", "[AccelByte] Failed to Create Bearer Token for Client Credentials")
			callback(false)
		end
	end

	HttpRequest:post(IamServerUrl, credentials_callback, payload_content_type, payload, headers)
end

function Login:CheckPlatformIdForExistingAccount(platform_user_id, callback)
	cat_print("accelbyte", "[AccelByte] Login:CheckPlatformIdForExistingAccount")

	local platform_id = nil

	if SystemInfo:distribution() == Idstring("STEAM") then
		platform_id = SteamPlatformId
	elseif SystemInfo:distribution() == Idstring("EPIC") then
		platform_id = EpicPlatformId
	end

	if not platform_id then
		callback(false)

		return
	end

	if not Login.player_session.access_token then
		callback(false)

		return
	end

	local publisher_namespace = PublisherNamespace
	local Url = string.format("%s/namespaces/%s/platformids/%s/platformuserids/%s", LambdaUrl, publisher_namespace, platform_id, platform_user_id)
	local headers = {
		Authorization = "Bearer " .. Login.player_session.access_token,
		Accept = "application/json"
	}

	local function existing_account_callback(success, response_body)
		cat_print("accelbyte", "[AccelByte] Callback CheckPlatformIdForExistingAccount : " .. Url)

		if success then
			cat_print("accelbyte", "[AccelByte] CheckPlatformIdForExistingAccount Success ")
			cat_print("accelbyte", "[AccelByte] Platform ID Found, logging in with Steam")
			cat_print("accelbyte", "[AccelByte] Responses Body : " .. response_body)

			local response_json = json.decode(response_body)
			publisher_user_id = response_json.userId

			Login:SerializeJsonString(response_json)
		else
			cat_print("accelbyte", "[AccelByte] CheckPlatformIdForExistingAccount Failed ")
			cat_print("accelbyte", "[AccelByte] Platform ID not found, Please create account on Starbreeze Player Portal")
		end

		callback(success)
	end

	cat_print("accelbyte", "[AccelByte] Call CheckPlatformIdForExistingAccount Platform User ID : " .. platform_user_id)
	HttpRequest:get(Url, existing_account_callback, headers)
end

EntitlementClazz = {
	SUBSCRIPTION = 5,
	APP = 1,
	ENTITLEMENT = 2,
	CODE = 4,
	DISTRIBUTION = 3,
	UNKNOWN = 6
}
EntitlementType = {
	UNKNOWN = 3,
	CONSUMABLE = 2,
	DURABLE = 1
}
EntitlementStatus = {
	UNKNOWN = 6,
	DISTRIBUTED = 4,
	INACTIVE = 2,
	REVOKED = 5,
	CONSUMED = 3,
	ACTIVE = 1
}
AppType = {
	GAME = 1,
	DEMO = 4,
	DLC = 3,
	SOFTWARE = 2,
	UNKNOWN = 5
}
Source = {
	ACHIEVEMENT = 4,
	PROMOTION = 3,
	OTHER = 7,
	PURCHASE = 1,
	REFERRAL_BONUS = 5,
	REDEEM_CODE = 6,
	IAP = 2,
	UNKNOWN = 8
}
CurrencyType = {
	VIRTUAL = 2,
	UNKNOWN = 3,
	REAL = 1
}
RegionData = {
	currencyNamespace = "",
	discountAmount = 0,
	expireAt = "",
	trialPrice = 0,
	discountPurchaseAt = "",
	discountExpireAt = "",
	discountedPrice = 0,
	currencyCode = "",
	discountPercentage = 0,
	purchaseAt = "",
	price = 0,
	currencyType = CurrencyType.REAL
}
Cycle = {
	UNKNOWN = 5,
	QUARTERLY = 3,
	MONTHLY = 2,
	YEARLY = 4,
	WEEKLY = 1
}
Recurring = {
	fixedTrialCycles = 0,
	fixedFreeDays = 0,
	graceDays = 0,
	cycle = Cycle.WEEKLY
}
ItemType = {
	BUNDLE = 4,
	INGAMEITEM = 3,
	CODE = 5,
	APP = 1,
	COINS = 2,
	SUBSCRIPTION = 6,
	UNKNOWN = 7
}
ItemSnapshot = {
	language = "",
	name = "",
	useCount = 0,
	createdAt = "",
	title = "",
	description = "",
	region = "",
	targetNamespace = "",
	maxCount = 0,
	targetItemId = "",
	maxCountPerUser = 0,
	itemId = "",
	stackable = false,
	thumbnailUrl = "",
	updatedAt = "",
	targetCurrencyCode = "",
	Namespace = "",
	boothName = "",
	appId = "",
	sku = "",
	baseAppId = "",
	appType = AppType.GAME,
	entitlementType = EntitlementType.DURABLE,
	itemType = ItemType.APP,
	regionDataItem = RegionData.price,
	recurring = Recurring,
	itemIds = {},
	features = {}
}
EntitlementInfo = {
	name = "",
	useCount = 0,
	createdAt = "",
	targetNamespace = "",
	startDate = "",
	endDate = "",
	stackable = false,
	grantedAt = "",
	features = "",
	itemNamespace = "",
	distributedQuantity = 0,
	itemId = "",
	userId = "",
	updatedAt = "",
	quantity = 0,
	Namespace = "",
	grantedCode = "",
	id = "",
	appId = "",
	sku = "",
	clazz = EntitlementClazz.APP,
	type = EntitlementType.DURABLE,
	status = EntitlementStatus.ACTIVE,
	appType = AppType.GAME,
	source = Source.PURCHASE,
	itemSnapshot = ItemSnapshot
}
Paging = {
	next = "",
	previous = ""
}
EntitlementPagingSlicedResult = {
	data = {},
	paging = Paging
}

function ConvertEntitlementClazzToEnum(value)
	if value == "APP" then
		return EntitlementClazz.APP
	elseif value == "ENTITLEMENT" then
		return EntitlementClazz.ENTITLEMENT
	elseif value == "DISTRIBUTION" then
		return EntitlementClazz.DISTRIBUTION
	elseif value == "CODE" then
		return EntitlementClazz.CODE
	elseif value == "SUBSCRIPTION" then
		return EntitlementClazz.SUBSCRIPTION
	else
		return EntitlementClazz.UNKNOWN
	end
end

function ConvertEntitlementTypeToEnum(value)
	if value == "DURABLE" then
		return EntitlementType.DURABLE
	elseif value == "CONSUMABLE" then
		return EntitlementType.CONSUMABLE
	else
		return EntitlementType.UNKNOWN
	end
end

function ConvertEntitlementStatusToEnum(value)
	if value == "ACTIVE" then
		return EntitlementStatus.ACTIVE
	elseif value == "INACTIVE" then
		return EntitlementStatus.INACTIVE
	elseif value == "CONSUMED" then
		return EntitlementStatus.CONSUMED
	elseif value == "DISTRIBUTED" then
		return EntitlementStatus.DISTRIBUTED
	elseif value == "REVOKED" then
		return EntitlementStatus.REVOKED
	else
		return EntitlementStatus.UNKNOWN
	end
end

function ConvertAppTypeToEnum(value)
	if value == "GAME" then
		return AppType.GAME
	elseif value == "SOFTWARE" then
		return AppType.SOFTWARE
	elseif value == "DLC" then
		return AppType.DLC
	elseif value == "DEMO" then
		return AppType.DEMO
	else
		return AppType.UNKNOWN
	end
end

function ConvertSourceToEnum(value)
	if value == "PURCHASE" then
		return Source.PURCHASE
	elseif value == "IAP" then
		return Source.IAP
	elseif value == "PROMOTION" then
		return Source.PROMOTION
	elseif value == "ACHIEVEMENT" then
		return Source.ACHIEVEMENT
	elseif value == "REFERRAL_BONUS" then
		return Source.REFERRAL_BONUS
	elseif value == "REDEEM_CODE" then
		return Source.REDEEM_CODE
	elseif value == "OTHER" then
		return Source.OTHER
	else
		return Source.UNKNOWN
	end
end

function ConvertCurrencyTypeToEnum(value)
	if value == "REAL" then
		return CurrencyType.REAL
	elseif value == "VIRTUAL" then
		return CurrencyType.VIRTUAL
	else
		return CurrencyType.UNKNOWN
	end
end

function ConvertCycleToEnum(value)
	if value == "WEEKLY" then
		return Cycle.WEEKLY
	elseif value == "MONTHLY" then
		return Cycle.MONTHLY
	elseif value == "QUARTERLY" then
		return Cycle.QUARTERLY
	elseif value == "YEARLY" then
		return Cycle.YEARLY
	else
		return Cycle.UNKNOWN
	end
end

function ConvertItemTypeToEnum(value)
	if value == "APP" then
		return ItemType.APP
	elseif value == "COINS" then
		return ItemType.COINS
	elseif value == "INGAMEITEM" then
		return ItemType.INGAMEITEM
	elseif value == "BUNDLE" then
		return ItemType.BUNDLE
	elseif value == "CODE" then
		return ItemType.CODE
	elseif value == "SUBSCRIPTION" then
		return ItemType.SUBSCRIPTION
	else
		return ItemType.UNKNOWN
	end
end

Entitlement = Entitlement or class()
Entitlement = {
	result = EntitlementPagingSlicedResult
}

function Entitlement:SetDLCEntitlements()
	local dlc_entitlements = {}
	local valid_namespace, valid_clazz, valid_type, valid_itemId, valid_status, valid_entitlement = nil

	for _, entitlement_data in ipairs(Entitlement.result.data) do
		if not table.contains(dlc_entitlements, entitlement_data.itemId) then
			table.insert(dlc_entitlements, entitlement_data.itemId)
		end
	end

	if managers.dlc then
		managers.dlc:set_entitlements(dlc_entitlements)
	end
end

function Entitlement:QueryEntitlementAsString(offset, limit, callback)
	cat_print("accelbyte", "[AccelByte] Entitlement:QueryEntitlementAsString")

	if not Login.player_session.access_token then
		callback(false)

		return
	end

	local namespace = Namespace
	local user_id = Login.player_session.user_id
	local Url = string.format("%s/platform/public/namespaces/%s/users/%s/entitlements?offset=%s&limit=%s", BaseUrl, namespace, user_id, offset, limit)
	local headers = {
		Authorization = "Bearer " .. Login.player_session.access_token
	}

	local function callback(success, response_body)
		if success then
			cat_print("accelbyte", "[AccelByte] Callback QueryEntitlementAsString Success: " .. Url)
			cat_print("accelbyte", "Response Body : " .. response_body)

			local response_json = json.decode(response_body)

			Entitlement:SerializeJsonString(response_json)
		else
			cat_print("accelbyte", "[AccelByte] Callback QueryEntitlementAsString Fail : " .. Url)
		end

		callback(success)
	end

	HttpRequest:get(Url, callback, headers)
end

function Entitlement:UpdateStat(stat_code, stat_value, update_method, callback)
	cat_print("accelbyte", "[AccelByte] Entitlement:UpdateStat")

	if not Login.player_session.access_token then
		callback(false)

		return
	end

	local payload_content_type = "application/json"
	local namespace = Namespace
	local user_id = Login.player_session.user_id
	local Url = string.format("%s/social/v2/public/namespaces/%s/users/%s/stats/%s/statitems/value", BaseUrl, PublisherNamespace, publisher_user_id, stat_code)
	local payload_body = {
		updateStrategy = update_method,
		value = stat_value
	}
	local payload_json = json.encode(payload_body)
	local headers = {
		Authorization = "Bearer " .. Login.player_session.access_token
	}

	local function callback(error_code, status_code, response_body)
		if status_code == 200 then
			cat_print("accelbyte", "[AccelByte] Callback UpdateStat Success: " .. Url)
			cat_print("accelbyte", "Response Body : " .. response_body)

			local response_json = json.decode(response_body)
			local current_value = response_json.currentValue

			cat_print("accelbyte", "[AccelByte] Stat Code =" .. stat_code .. "  Current value = " .. current_value)
			callback(true)
		else
			cat_print("accelbyte", "[AccelByte] Callback UpdateStat Fail : " .. Url)
			cat_print("accelbyte", "[AccelByte] Callback UpdateStat ErrorCode : " .. error_code)
			callback(false)
		end
	end

	HttpRequest:put(Url, callback, payload_content_type, payload_json, headers)
end

function Entitlement:UpdateCrossGameRecognition()
	if not Login.player_session.access_token then
		return
	end

	local base_url = BaseUrl
	local namespace = Namespace
	local user_id = Login.player_session.user_id
	local headers = {
		Authorization = "Bearer " .. Login.player_session.access_token,
		Accept = "application/json"
	}
	local payload_content_type = "application/json"
	local completed_index = 0
	local completed_achievement_list = {
		"death_28",
		"death_29",
		"pick_66",
		"death_30",
		"axe_66",
		"ggez_1"
	}

	for index, achievement_id in ipairs(completed_achievement_list) do
		local achievement = managers.achievment:get_info(achievement_id)

		if achievement and achievement.awarded then
			completed_index = index
		end
	end

	local wanted_stats = {
		["user-launch-game"] = 1,
		["user-infamy"] = managers.experience:current_rank(),
		["diff-very-hard"] = completed_index >= 1 and 1 or 0,
		["diff-overkill"] = completed_index >= 2 and 1 or 0,
		["diff-mayhem"] = completed_index >= 3 and 1 or 0,
		["diff-deathwish"] = completed_index >= 4 and 1 or 0,
		["diff-deathsentence"] = completed_index >= 5 and 1 or 0,
		["diff-ds-one"] = completed_index >= 6 and 1 or 0,
		secret = managers.achievment:get_info("fin_1").awarded and 1 or 0
	}
	local create_stats = {}
	local update_stats = {}

	local function on_stats_received(success, body)
		cat_print("accelbyte", "[AccelByte] on_stats_received", success, body)

		if success then
			local stats = json.decode(body)
			local existing_stats = {}

			if stats and stats.data then
				for _, stat in ipairs(stats.data) do
					existing_stats[stat.statCode] = stat.value
				end
			end

			for stat_code, value in pairs(wanted_stats) do
				if not existing_stats[stat_code] then
					table.insert(create_stats, {
						statCode = stat_code
					})
				end

				if existing_stats[stat_code] ~= value then
					table.insert(update_stats, {
						updateStrategy = "OVERRIDE",
						statCode = stat_code,
						value = value
					})
				end
			end

			if #create_stats > 0 then
				local url = string.format("%s/social/v1/public/namespaces/%s/users/%s/statitems/bulk", base_url, namespace, user_id)
				local payload_json = json.encode(create_stats)

				local function clbk(...)
					cat_print("accelbyte", "[AccelByte]", ...)
				end

				HttpRequest:post(url, clbk, payload_content_type, payload_json, headers)
			end

			if #update_stats > 0 then
				local url = string.format("%s/social/v2/public/namespaces/%s/users/%s/statitems/value/bulk", base_url, namespace, user_id)
				local payload_json = json.encode(update_stats)

				local function clbk(...)
					cat_print("accelbyte", "[AccelByte]", ...)
				end

				HttpRequest:put(url, clbk, payload_content_type, payload_json, headers)
			end
		end
	end

	local stat_code_url = ""
	local stat_codes = table.map_keys(wanted_stats)

	for index, stat_code in ipairs(stat_codes) do
		stat_code_url = stat_code_url .. stat_code

		if index < #stat_codes then
			stat_code_url = stat_code_url .. "%2C"
		end
	end

	local url = string.format("%s/social/v1/public/namespaces/%s/users/%s/statitems?statCodes=%s&offset=0&limit=%d", base_url, namespace, user_id, stat_code_url, #stat_codes)

	HttpRequest:get(url, on_stats_received, headers)
end

function Entitlement:CheckAndVerifyUserEntitlement(callback)
	Entitlement.result.data = {}
	local player_id = managers.network.account:player_id()

	Telemetry:send_on_game_launch()

	local function entitlement_callback(success)
		Entitlement:SetDLCEntitlements()
	end

	local function login_callback(error_code, status_code, response_body)
		cat_print("accelbyte", "Callback login_callback ")

		Global.telemetry._has_account_checked = true

		Telemetry:on_login()
		Telemetry:on_login_screen_passed()

		local function update_stat_callback(error_code, status_code, response_body)
			cat_print("accelbyte", "Callback update_stat_callback ")
			Entitlement:QueryEntitlementAsString(0, 100, entitlement_callback)
			Entitlement:UpdateCrossGameRecognition()
		end

		Entitlement:UpdateStat("sync-platformupgrade", 1, "INCREMENT", update_stat_callback)
	end

	local function check_platform_callback(success)
		cat_print("accelbyte", "Callback Platform Check -- Success: " .. tostring(success))

		if success then
			Login.has_account = true

			cat_print("accelbyte", "[AccelByte] Linked Starbreeze User for this Platform ID is found")

			if SystemInfo:distribution() == Idstring("STEAM") then
				local function get_steamticket_callback(ticket)
					if ticket == "" then
						cat_print("accelbyte", "[AccelByte] Failed to authenticate Steam Ticket, reason : " .. reason)

						return
					end

					local function login_with_steam_callback(success, reason)
						if success then
							cat_print("accelbyte", "[AccelByte] Successfully authenticated the Steam Ticket, now logging in with Steam to AB Backend , callback reason " .. reason)
							Login:LoginWithSteamToken(ticket, login_callback)
						else
							cat_print("accelbyte", "[AccelByte] Failed to authenticate Steam Ticket, reason : " .. reason)
						end
					end

					Steam:bind_steam_ticket_validate_callback(player_id, login_with_steam_callback, ticket)
					Login:LoginWithSteamToken(ticket, login_callback)
				end

				Utility:get_steamticket(get_steamticket_callback)
			elseif SystemInfo:distribution() == Idstring("EPIC") then
				local ticket = EpicEntitlements:get_epic_ticket()

				if string.len(ticket) > 0 then
					cat_print("accelbyte", "[AccelByte] Successfully authenticated the Epic Ticket, now logging in with Epic to AB Backend")
					Login:LoginWithEpicToken(ticket, login_callback)
				else
					cat_print("accelbyte", "[AccelByte] Failed to retrieve Epic Ticket")
				end
			else
				Login:LoginWithUsernamePassword("username@email.com", "password_sample")
			end
		else
			Login.has_account = false
			Global.telemetry._has_account_checked = true

			Telemetry:on_login()
			Telemetry:on_login_screen_passed()
			cat_print("accelbyte", "[AccelByte] Linked Starbreeze User for this Platform ID is not found")
			Entitlement:SetDLCEntitlements()
		end
	end

	local function get_client_token_callback(success)
		if success then
			Login:CheckPlatformIdForExistingAccount(player_id, check_platform_callback)
		else
			Login.has_account = false
			Global.telemetry._has_account_checked = true

			Telemetry:on_login()
			Telemetry:on_login_screen_passed()
			cat_print("accelbyte", "[AccelByte] Login:LoginWithClientCredentials failed")
			Entitlement:SetDLCEntitlements()
		end
	end

	if Login.player_session.platform_user_id == player_id then
		Entitlement:QueryEntitlementAsString(0, 100, entitlement_callback)
	else
		Login:LoginWithClientCredentials(get_client_token_callback)
	end
end

function Entitlement:SerializeJsonString(document)
	cat_print("accelbyte", "[AccelByte] Entitlement:SerializeJsonString")

	local data = document.data

	for key = 1, table.getn(data) do
		local Recurring = {}
		local ItemSnapshot = {}
		local itemSnapshot = data[key].itemSnapshot

		if itemSnapshot ~= nil then
			local recurring = itemSnapshot.recurring

			if recurring ~= nil then
				Recurring = {
					cycle = ConvertCycleToEnum(recurring.cycle),
					fixedFreeDays = recurring.fixedFreeDays,
					fixedTrialCycles = recurring.fixedTrialCycles,
					graceDays = recurring.graceDays
				}
			end

			ItemSnapshot = {
				itemId = itemSnapshot.itemId,
				appId = itemSnapshot.appId,
				appType = ConvertAppTypeToEnum(itemSnapshot.appType),
				baseAppId = itemSnapshot.baseAppId,
				sku = itemSnapshot.sku,
				Namespace = itemSnapshot.namespace,
				name = itemSnapshot.name,
				entitlementType = ConvertEntitlementTypeToEnum(itemSnapshot.entitlementType),
				useCount = itemSnapshot.useCount,
				stackable = itemSnapshot.stackable,
				itemType = ConvertItemTypeToEnum(itemSnapshot.itemType),
				thumbnailUrl = itemSnapshot.thumbnailUrl,
				targetNamespace = itemSnapshot.targetNamespace,
				targetCurrencyCode = itemSnapshot.targetCurrencyCode,
				targetItemId = itemSnapshot.targetItemId,
				title = itemSnapshot.title,
				description = itemSnapshot.description,
				regionDataItem = itemSnapshot.regionDataItem,
				recurring = Recurring,
				itemIds = itemSnapshot.itemIds,
				features = itemSnapshot.features,
				maxCountPerUser = itemSnapshot.maxCountPerUser,
				maxCount = itemSnapshot.maxCount,
				boothName = itemSnapshot.boothName,
				region = itemSnapshot.region,
				language = itemSnapshot.language,
				createdAt = itemSnapshot.createdAt,
				updatedAt = itemSnapshot.updatedAt
			}
		end

		local entitlementInfo = {
			id = data[key].id,
			Namespace = data[key].namespace,
			clazz = ConvertEntitlementClazzToEnum(data[key].clazz),
			type = ConvertEntitlementTypeToEnum(data[key].type),
			status = ConvertEntitlementStatusToEnum(data[key].status),
			appId = data[key].appId,
			appType = ConvertAppTypeToEnum(data[key].appType),
			sku = data[key].sku,
			userId = data[key].userId,
			itemId = data[key].itemId,
			grantedCode = data[key].grantedCode,
			itemNamespace = data[key].itemNamespace,
			name = data[key].name,
			features = data[key].features,
			useCount = data[key].useCount,
			quantity = data[key].quantity,
			source = ConvertSourceToEnum(data[key].source),
			distributedQuantity = data[key].appId,
			targetNamespace = data[key].appId,
			itemSnapshot = ItemSnapshot,
			startDate = data[key].startDate,
			endDate = data[key].endDate,
			stackable = data[key].stackable,
			grantedAt = data[key].grantedAt,
			createdAt = data[key].createdAt,
			updatedAt = data[key].updatedAt
		}

		table.insert(self.result.data, entitlementInfo)
	end

	self.result.paging.next = document.paging.next
	self.result.paging.previous = document.paging.previous
end
