HttpRequest = HttpRequest or class()

function HttpRequest:init()
	self._requests = self._requests or {}
	self.handler = Steam

	if table.size(self._requests) > 0 then
		self:check_requests()
	end
end

function HttpRequest:update(t, dt)
	self:check_requests()
end

function HttpRequest:on_request_done(clbk, ...)
	self._current_request = false

	if clbk then
		clbk(...)
	end

	self:check_requests()
end

function HttpRequest:check_requests()
	if self._current_request then
		return
	end

	self._current_request = table.remove(self._requests, 1)

	if self._current_request then
		local method = self._current_request.method or "get"
		local url = self._current_request.url
		local clbk = callback(self, self, "on_request_done", self._current_request.clbk)
		local content_type = self._current_request.content_type or ""
		local body = self._current_request.body or ""
		local body_size = string.len(body)
		local headers = self._current_request.headers and type(self._current_request.headers) == "table" and self._current_request.headers or {
			self._current_request.headers
		}

		if method == "get" then
			self.handler:http_request(url, clbk, headers)
		elseif method == "post" then
			self.handler:http_request_post(url, clbk, content_type, body, body_size, headers)
		elseif method == "put" then
			self.handler:http_request_put(url, clbk, content_type, body, body_size, headers)
		else
			self._current_request = false

			self:check_requests()
		end
	end
end

function HttpRequest:create_request(method, url, clbk, content_type, body, headers, key)
	if key then
		if self._current_request and self._current_request.key and self._current_request.key == key then
			return
		end

		for i, request in ipairs(self._requests) do
			if request.key and request.key == key then
				request.method = method
				request.url = url
				request.clbk = clbk
				request.content_type = content_type
				request.body = body
				request.headers = headers

				self:check_requests()

				return
			end
		end
	end

	local new_request = {}

	new_request.method = method
	new_request.url = url
	new_request.clbk = clbk
	new_request.content_type = content_type
	new_request.body = body
	new_request.headers = headers
	new_request.key = key

	table.insert(self._requests, new_request)
	self:check_requests()
end

function HttpRequest:get(url, clbk, headers, key)
	local function new_clbk(error_code, status_code, response_body)
		if status_code >= 200 and status_code <= 206 then
			clbk(true, response_body)
		else
			clbk(false)
		end
	end

	Distribution:make_http_request("GET", url, new_clbk, headers)
end

function HttpRequest:post(url, clbk, content_type, body, headers, key)
	Distribution:make_http_request("POST", url, clbk, headers, content_type, body, string.len(body))
end

function HttpRequest:put(url, clbk, content_type, body, headers, key)
	Distribution:make_http_request("PUT", url, clbk, headers, content_type, body, string.len(body))
end
